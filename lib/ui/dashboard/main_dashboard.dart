import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/ui/dashboard/account_page.dart';
import 'package:shakti/ui/dashboard/home_page.dart';
import 'package:shakti/ui/dashboard/my_query_page.dart';
import 'package:shakti/ui/dashboard/notification_page.dart';
import 'package:shakti/ui/widgets/bottom_nav.dart';

class MainDashboardPage extends StatefulWidget {
  const MainDashboardPage({Key? key}) : super(key: key);

  @override
  _MainDashboardPageState createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  late PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(children: [
                Image(
                  image: const AssetImage(ImageAsset.imgEllipseBg),
                  width: MediaQuery.of(context).size.width * 0.65,
                ),
                PageView(
                  controller: _tabsPageController,
                  onPageChanged: (num) {
                    setState(() {
                      _selectedTab = num;
                    });
                  },
                  children: [
                    HomePage(),
                    NotificationPage(),
                    MyQueryPage(),
                    // AccountPage(),
                  ],
                ),
              ]),
            ),
            BottomNav(
              selectedTab: _selectedTab,
              tabPressed: (num) {
                _tabsPageController.animateToPage(num,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic);
              },
            ),
          ],
        ),
      ),
    );
  }
}
