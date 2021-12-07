import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_input.dart';
import '../../route/route.dart' as route;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Forgot".toUpperCase(),
                style: AppStyle.mainHeadingStyle,
              ),
              Text(
                "Password".toUpperCase(),
                style: AppStyle.mainHeadingStyle,
              ),
              const Text(
                "Don't worry! We will help you.",
                style: AppStyle.captionStyle,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(ImageAsset.imgLogo),
                        height: 200,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomInput(
                        hintText: "Mobile number",
                        onSubmitted: (text) {},
                        onChanged: (text) {},
                        icon: Icons.phone,
                        actionIcon: Icons.close,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              CustomBtn(text: "Verify", onPressed: () {}, isLoading: false),
            ],
          ),
        ),
      ),
    );
  }
}
