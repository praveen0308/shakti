import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/image_assets.dart';

class BottomNav extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  const BottomNav(
      {Key? key, required this.selectedTab, required this.tabPressed})
      : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab;

    return Container(
      decoration: BoxDecoration(
          color: MyColor.bottomNavBackground,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagePath: ImageAsset.icHome,
            label: "   Home  ",
            selected: _selectedTab == 0 ? true : false,
            onPressed: () {
              widget.tabPressed(0);
            },
          ),
          BottomTabBtn(
            imagePath: ImageAsset.icNotification,
            label: "Notification",
            selected: _selectedTab == 1 ? true : false,
            onPressed: () {
              widget.tabPressed(1);
            },
          ),
          BottomTabBtn(
            imagePath: ImageAsset.icQuery,
            label: "My Query",
            selected: _selectedTab == 2 ? true : false,
            onPressed: () {
              widget.tabPressed(2);
            },
          ),
          /* BottomTabBtn(
            imagePath: ImageAsset.icAccount,
            label: "Account",
            selected: _selectedTab == 3 ? true : false,
            onPressed: () {
              widget.tabPressed(3);
            },
          ),*/
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool selected;
  final Function() onPressed;

  const BottomTabBtn(
      {Key? key,
      required this.imagePath,
      required this.label,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 5.0,
        ))),
        child: Column(
          children: [
            Image(
              image: AssetImage(imagePath),
              width: 24.0,
              height: 24.0,
              color: Colors.white,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
