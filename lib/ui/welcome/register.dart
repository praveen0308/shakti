import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/model/user_model.dart';
import 'package:shakti/repository/user_repository.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/res/styles.dart';
import 'package:shakti/ui/widgets/custom_btn.dart';
import 'package:shakti/ui/widgets/custom_input.dart';
import 'package:shakti/ui/widgets/widgets.dart';
import '../../route/route.dart' as route;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel userModel = UserModel();
  bool isLoading = false;

  Future<void> addUserDetail() async {
    userModel.userId = user!.uid;
    userModel.status = "user";
    userModel.mobileNo = user!.phoneNumber;
    setState(() {
      isLoading = true;
    });
    await UserRepository.addNewUserDetail(userModel)
        .then((value) => setState(() {
              isLoading = false;
            }));

    if (!mounted) return;

    Navigator.pushNamed(context, route.mainDashboard);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registered successfully!!!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Register".toUpperCase(),
                  style: AppStyle.mainHeadingStyle,
                ),
                const Text(
                  "Nice to see you!",
                  style: AppStyle.captionStyle,
                ),
                Container(
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
                        hintText: "Enter name",
                        onSubmitted: (text) {},
                        onChanged: (text) {
                          userModel.name = text;
                        },
                        icon: Icons.person,
                        actionIcon: Icons.close,
                      ),
                      CustomInput(
                        hintText: "Email",
                        onSubmitted: (text) {},
                        onChanged: (text) {
                          userModel.email = text;
                        },
                        icon: Icons.email,
                        actionIcon: Icons.close,
                      ),
                      /*CustomInput(
                        hintText: "Mobile number",
                        onSubmitted: (text) {},
                        onChanged: (text) {},
                        icon: Icons.phone,
                        actionIcon: Icons.close,
                      ),
                      CustomInput(
                        hintText: "Password",
                        onSubmitted: (text) {},
                        onChanged: (text) {},
                        icon: Icons.lock,
                        isPasswordField: true,
                      ),
                      CustomInput(
                        hintText: "Confirm Password",
                        onSubmitted: (text) {},
                        onChanged: (text) {},
                        icon: Icons.lock,
                        isPasswordField: true,
                      )*/
                    ],
                  ),
                ),
                CustomBtn(
                    text: "Register",
                    onPressed: addUserDetail,
                    isLoading: isLoading),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already member?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.pushNamed(context, route.loginPage);
                        },
                        child: const Text(
                          "Login",
                          style: AppStyle.textButtonStyle,
                        ))
                  ],
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
