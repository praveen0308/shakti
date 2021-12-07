import 'package:flutter/material.dart';
import 'package:shakti/res/custom_colors.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool outlineBtn;

  final bool isLoading;

  const CustomBtn({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.outlineBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: !isLoading,
          child: Container(
            height: 48.0,
            decoration: BoxDecoration(
              color: outlineBtn ? Colors.transparent : MyColor.primary,
              border: Border.all(
                color: MyColor.primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              child: Center(
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: outlineBtn ? MyColor.primary : Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Center(
            child: SizedBox(
              height: 36,
              width: 36,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
