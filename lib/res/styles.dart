import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/res/custom_colors.dart';

class AppStyle {
  // text styles
  static const mainHeadingStyle = TextStyle(
      color: MyColor.primary,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: 4.5);

  static const pageTitleStyle = TextStyle(
    color: MyColor.primary,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static const inputLabelStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const captionStyle = TextStyle(
      color: MyColor.primary,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.4);

  static const textButtonStyle = TextStyle(
      color: MyColor.primary,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: 1.4);

  static const regularDarkText = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black54);

  static const title2 = TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black);
}
