import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/document_request_model.dart';
import 'package:shakti/repository/service_repository.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/strings.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_dropdown.dart';
import 'package:shakti/utils/my_date_formatter.dart';
import 'package:shakti/utils/request_status.dart';

class RequestDocument extends StatefulWidget {
  const RequestDocument({Key? key}) : super(key: key);

  @override
  _RequestDocumentState createState() => _RequestDocumentState();
}

class _RequestDocumentState extends State<RequestDocument> {
  DocumentRequestModel requestModel = DocumentRequestModel();

  var isLoading = false;

  Future<void> addDocumentRequest() async {
    requestModel.addedOn = MyDateFormatter.getCurrentTime();
    requestModel.status = RequestStatus.requested;

    setState(() {
      isLoading = true;
    });
    await ServiceRepository.addNewDocumentRequest(requestModel)
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
        title: const Text("Request Document"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomDropDown(
                hint: "Select document",
                itemList: Strings.documentTypes,
                onItemSelected: (value) {
                  requestModel.type = value;
                }),
            CustomDropDown(
                hint: "Select action",
                itemList: Strings.actions,
                onItemSelected: (value) {
                  requestModel.description = value;
                }),
            const Spacer(
              flex: 1,
            ),
            CustomBtn(
              text: "Send request",
              onPressed: () {
                addDocumentRequest();
              },
              isLoading: isLoading,
            )
          ],
        ),
      ),
    );
  }
}
