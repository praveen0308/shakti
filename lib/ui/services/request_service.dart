import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/service_request_model.dart';
import 'package:shakti/repository/service_repository.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_input.dart';
import 'package:shakti/ui/widgets/pick_image_options.dart';
import 'package:shakti/ui/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shakti/utils/my_date_formatter.dart';
import 'package:shakti/utils/request_status.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class RequestService extends StatefulWidget {
  const RequestService({Key? key}) : super(key: key);

  @override
  _RequestServiceState createState() => _RequestServiceState();
}

class _RequestServiceState extends State<RequestService> {
  ServiceRequestModel requestModel = ServiceRequestModel();
  List<File> images = [];

  var isLoading = false;
  String serviceType = "Road Repairing";

  Future<void> addServiceRequest() async {
    setState(() {
      isLoading = true;
    });
    requestModel.addedOn = MyDateFormatter.getCurrentTime();
    requestModel.status = RequestStatus.requested;
    requestModel.type = serviceType;
    if (images.isNotEmpty) {
      requestModel.images = await uploadImages(images);
    } else {
      requestModel.images = [];
    }

    await ServiceRepository.addNewServiceRequest(requestModel)
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

  Future<List<String>> uploadImages(List<File> _images) async {
    var imageUrls =
        await Future.wait(_images.map((_image) => uploadFileToStorage(_image)));
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadFileToStorage(File _image) async {
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/image_${DateTime.now()}');
    UploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.then((p0) => {});
    return await storageReference.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    serviceType = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: MyColor.primary),
        titleTextStyle: const TextStyle(
            color: MyColor.primary, fontSize: 20, fontWeight: FontWeight.w500),
        title: const Text("Request Service"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Enter the address:",
                  style: AppStyle.inputLabelStyle,
                ),
                CustomInput(
                    hintText: "Flat No./Building Name/Area name",
                    onChanged: (text) {
                      requestModel.areaName = text;
                    },
                    onSubmitted: (text) {}),
                CustomInput(
                    hintText: "Street name/Land Mark",
                    onChanged: (text) {
                      requestModel.landmark = text;
                    },
                    onSubmitted: (text) {}),
                CustomInput(
                    hintText: "City/Village",
                    onChanged: (text) {
                      requestModel.city = text;
                    },
                    onSubmitted: (text) {}),
                CustomInput(
                  hintText: "Pincode",
                  onChanged: (text) {
                    requestModel.pincode = text;
                  },
                  onSubmitted: (text) {},
                  textInputType: TextInputType.number,
                ),
                CustomInput(
                    hintText: "State",
                    onChanged: (text) {
                      requestModel.state = text;
                    },
                    onSubmitted: (text) {}),
                const Text(
                  "Images:",
                  style: AppStyle.inputLabelStyle,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.amber,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.file(
                              images[index],
                            )),
                      );
                    }),
                PickImageOptions(
                  onCameraClick: _getFromCamera,
                  onGalleryClick: _getFromGallery,
                ),
                const SizedBox(
                  height: 64,
                ),
                CustomBtn(
                    text: "File Request",
                    onPressed: () {
                      addServiceRequest();
                    },
                    isLoading: isLoading),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    List<XFile>? pickedImages = await ImagePicker().pickMultiImage(
      maxWidth: 480,
      maxHeight: 480,
    );
    if (pickedImages != null) {
      setState(() {
        images.addAll(pickedImages.map((e) => File(e.path)));
      });
    }
  }

  /// Get from camera
  _getFromCamera() async {
    XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 480,
      maxHeight: 480,
    );
    if (pickedImage != null) {
      setState(() {
        images.add(File(pickedImage.path));
      });
    }
  }
}
