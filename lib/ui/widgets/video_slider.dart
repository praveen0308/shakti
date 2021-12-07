import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/res/image_assets.dart';
import 'package:shakti/ui/widgets/slider_indicator.dart';

class VideoSlider extends StatefulWidget {
  const VideoSlider({Key? key}) : super(key: key);

  @override
  _VideoSliderState createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
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
    return Column(
      children: [
        PageView.builder(
            controller: _tabsPageController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 250,
                height: 180,
                child: Image(
                    fit: BoxFit.fill, image: AssetImage(ImageAsset.imgLogo)),
              );
            }),
        SliderIndicator(noOfItems: 4, selectedIndex: _selectedTab)
      ],
    );
  }
}
