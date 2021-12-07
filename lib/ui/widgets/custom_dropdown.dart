import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakti/res/custom_colors.dart';

class CustomDropDown extends StatefulWidget {
  final String hint;
  final List<dynamic> itemList;
  final Function(dynamic) onItemSelected;

  const CustomDropDown(
      {Key? key,
      required this.hint,
      required this.itemList,
      required this.onItemSelected})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedDocument;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: MyColor.primary),
          borderRadius: BorderRadius.circular(12.0)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          iconEnabledColor: MyColor.primary,
          value: selectedDocument,
          isExpanded: true,
          items: widget.itemList.map(buildDropDownMenuItem).toList(),
          onChanged: (value) {
            widget.onItemSelected(value);
            setState(() {
              selectedDocument = value!;
            });
          },
          hint: Text(widget.hint),
        ),
      ),
    );
  }
}

DropdownMenuItem<dynamic> buildDropDownMenuItem(dynamic item) =>
    DropdownMenuItem(
        value: item.toString(),
        child: Text(
          item.toString(),
          style: const TextStyle(fontSize: 14),
        ));
