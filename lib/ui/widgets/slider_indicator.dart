import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/res/custom_colors.dart';

class SliderIndicator extends StatefulWidget {
  final int noOfItems;
  final int selectedIndex;

  const SliderIndicator(
      {Key? key, required this.noOfItems, required this.selectedIndex})
      : super(key: key);

  @override
  _SliderIndicatorState createState() => _SliderIndicatorState();
}

class _SliderIndicatorState extends State<SliderIndicator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.noOfItems,
        itemBuilder: (BuildContext context, int index) {
          return SliderIndicatorItem(selected: widget.selectedIndex == index);
        });
  }
}

class SliderIndicatorItem extends StatelessWidget {
  final bool selected;
  final double itemSize = 10.0;

  const SliderIndicatorItem({Key? key, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemSize,
      height: itemSize,
      decoration: BoxDecoration(
          color: selected ? MyColor.primary : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(itemSize / 2)),
          border: Border.all(
            color: MyColor.primary,
            width: 2,
          )),
    );
  }
}
