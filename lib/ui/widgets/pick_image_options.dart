import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/res/styles.dart';

class PickImageOptions extends StatelessWidget {
  final Function() onCameraClick;
  final Function() onGalleryClick;

  const PickImageOptions(
      {Key? key, required this.onCameraClick, required this.onGalleryClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Pick image from",
            style: AppStyle.inputLabelStyle,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: onCameraClick,
                  child: const Icon(
                    Icons.camera_alt,
                    size: 36,
                  )),
              const Text("or"),
              GestureDetector(
                  onTap: onGalleryClick,
                  child: const Icon(
                    Icons.photo,
                    size: 36,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
