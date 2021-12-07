import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/scheme_request_model.dart';
import 'package:shakti/repository/service_repository.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/strings.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_dropdown.dart';
import 'package:shakti/ui/widgets/custom_input.dart';
import 'package:shakti/utils/my_date_formatter.dart';
import 'package:shakti/utils/request_status.dart';

class RequestFreeTuition extends StatefulWidget {
  const RequestFreeTuition({Key? key}) : super(key: key);

  @override
  _RequestFreeTuitionState createState() => _RequestFreeTuitionState();
}

class _RequestFreeTuitionState extends State<RequestFreeTuition> {
  SchemeRequestModel requestModel = SchemeRequestModel();

  var isLoading = false;

  Future<void> addSchemeRequest() async {
    requestModel.addedOn = MyDateFormatter.getCurrentTime();
    requestModel.status = RequestStatus.requested;
    setState(() {
      isLoading = true;
    });
    await ServiceRepository.addNewSchemeRequest(requestModel)
        .then((value) => setState(() {
              isLoading = false;
            }));

    if (!mounted) return;

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Added successfully!!!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: MyColor.primary),
        titleTextStyle: const TextStyle(
            color: MyColor.primary, fontSize: 20, fontWeight: FontWeight.w500),
        title: const Text("Request free tuition"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomDropDown(
                hint: "Select class",
                itemList: Strings.classes,
                onItemSelected: (value) {
                  requestModel.type = "Free tuition - $value";
                  requestModel.description = "Get Details";
                }),
            const Spacer(
              flex: 1,
            ),
            CustomBtn(
              text: "Send request",
              onPressed: () {
                addSchemeRequest();
              },
              isLoading: isLoading,
            )
          ],
        ),
      ),
    );
  }
}
