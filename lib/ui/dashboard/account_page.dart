import 'package:flutter/cupertino.dart';
import 'package:shakti/res/styles.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Account".toUpperCase(),
            style: AppStyle.mainHeadingStyle,
          ),
          const Text(
            "Manage your account settings.",
            style: AppStyle.captionStyle,
          ),
          Expanded(child: ListView())
        ],
      ),
    );
  }
}
