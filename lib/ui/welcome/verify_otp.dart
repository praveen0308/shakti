import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/user_model.dart';
import 'package:shakti/model/verify_otp_arguments.dart';
import 'package:shakti/repository/user_repository.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_input.dart';
import '../../route/route.dart' as route;

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  late VerifyOtpArguments otpArguments;
  String otp = "";
  String? error;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    otpArguments =
        ModalRoute.of(context)!.settings.arguments as VerifyOtpArguments;

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
                "Verify Otp".toUpperCase(),
                style: AppStyle.mainHeadingStyle,
              ),
              const Text(
                "Enter received otp sent on your entered mobile number.",
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
                        hintText: "Enter otp",
                        onSubmitted: (text) {},
                        onChanged: (text) {
                          otp = text;
                        },
                        icon: Icons.phone,
                        actionIcon: Icons.close,
                        textInputType: TextInputType.phone,
                        maxLength: 6,
                      ),
                      Visibility(
                          visible: error != null, child: Text(error ?? ""))
                    ],
                  ),
                ),
              ),
              CustomBtn(
                  text: "Verify",
                  onPressed: () {
                    // Navigator.pushNamed(context, route.mainDashboard);
                    if (otp.length == 6) {
                      verifyCode();
                    } else {}
                  },
                  isLoading: false),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't you received otp??"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, route.register);
                      },
                      child: const Text(
                        "Resend",
                        style: AppStyle.textButtonStyle,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void verifyCode() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: otpArguments.verificationId, smsCode: otp);

    print("PhoneAuthCredentical >> $phoneAuthCredential");

    try {
      await _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((value) async {
        _displayError(null);
        UserModel? usr;
        await UserRepository.checkUserExists("gBnOa3hPwFUTHG4qXKmKdDCIcoF2")
            .then((value) => usr = value);
        if (usr == null) {
          print("User doesn't exist !!");
          print("User >>> ${usr}");
        } else {
          print("Successfully logged in!!!");
          Navigator.pushNamed(context, route.mainDashboard);
        }
        print("User UID >>> ${value.user!.uid}");
      });
    } catch (e) {
      _displayError("Incorrect Otp!!!");
      print("Incorrect Otp!!!!");
      print("Exception >>$e");
    }
  }

  void _displayError(String? txt) {
    setState(() {
      error = txt;
    });
  }
}
