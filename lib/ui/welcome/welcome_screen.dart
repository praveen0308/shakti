import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import '../../route/route.dart' as route;

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Welcome".toUpperCase(),
                  style: AppStyle.mainHeadingStyle,
                ),
                const Text(
                  "To shakti app",
                  style: AppStyle.captionStyle,
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    child: const Image(
                      image: AssetImage(ImageAsset.imgLogo),
                    ),
                  ),
                ),
                CustomBtn(
                    text: "Register",
                    onPressed: () {
                      Navigator.pushNamed(context, route.register);
                    },
                    isLoading: false),
                CustomBtn(
                  text: "Login",
                  onPressed: () {
                    Navigator.pushNamed(context, route.loginPage);
                  },
                  isLoading: false,
                  outlineBtn: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
