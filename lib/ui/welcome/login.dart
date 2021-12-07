import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/verify_otp_arguments.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_input.dart';
import '../../route/route.dart' as route;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String mobileNumber = "";
  late PhoneAuthCredential _phoneAuthCredential;
  late String _verificationId;
  late int _receivedToken;
  bool isLoading = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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
                "Login".toUpperCase(),
                style: AppStyle.mainHeadingStyle,
              ),
              const Text(
                "Welcome back!",
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
                        hintText: "Enter mobile number",
                        onSubmitted: (text) {},
                        onChanged: (text) {
                          mobileNumber = text;
                        },
                        icon: Icons.phone,
                        actionIcon: Icons.close,
                        textInputType: TextInputType.phone,
                        prefix: "+91",
                        maxLength: 10,
                      ),
                    ],
                  ),
                ),
              ),
              CustomBtn(
                  text: "Continue",
                  onPressed: () {
                    // Navigator.pushNamed(context, route.mainDashboard);
                    if (mobileNumber.length == 10) {
                      verifyNumber();
                    } else {}
                  },
                  isLoading: isLoading),
            ],
          ),
        ),
      ),
    );
  }

  void _displayLoading(bool status) {
    setState(() {
      isLoading = status;
    });
  }

  Future<void> verifyNumber() async {
    _displayLoading(true);
    await _firebaseAuth.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: '+91$mobileNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        print("verificationCompleted >>> $credential");
        _phoneAuthCredential = credential;
        await _firebaseAuth.signInWithCredential(credential).then((value) {
          print("User UID >>> ${value.user!.uid}");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print("verificationFailed >>> $e");
      },
      codeSent: (String verificationId, int? resendToken) {
        print(
            "codeSent >>> verificationId : $verificationId and resendToken : $resendToken");
        _verificationId = verificationId;
        if (resendToken != null) _receivedToken = resendToken;
        Navigator.pushNamed(context, route.verifyOtp,
            arguments:
                VerifyOtpArguments(_verificationId, _receivedToken.toString()));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print("codeAutoRetrievalTimeout >>> $verificationId");
        _verificationId = verificationId;
      },
    );
  }
}
