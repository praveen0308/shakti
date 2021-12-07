import 'package:flutter/material.dart';
import 'package:shakti/res/custom_colors.dart';
import 'package:shakti/res/styles.dart';

class CustomInput extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool isPasswordField;
  final IconData? icon;
  final IconData? actionIcon;
  final String actionType;
  final String? text;
  final String? prefix;
  final int? maxLength;

  const CustomInput(
      {required this.hintText,
      required this.onChanged,
      required this.onSubmitted,
      this.focusNode,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.isPasswordField = false,
      this.icon,
      this.actionIcon,
      this.actionType = "clear",
      this.text,
      this.prefix,
      this.maxLength});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    String text = widget.text ?? "";
    bool _isPasswordField = widget.isPasswordField;

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.black26, width: 1)),
      child: Row(
        children: [
          Visibility(
              visible: widget.icon == null ? false : true,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Icon(widget.icon),
              )),
          Flexible(
            fit: FlexFit.tight,
            child: TextField(
              keyboardType: widget.textInputType,
              controller: TextEditingController()..text = text,
              obscureText: _isPasswordField,
              focusNode: widget.focusNode,
              onChanged: (value) {
                widget.onChanged(value);
              },
              onSubmitted: widget.onSubmitted,
              textInputAction: widget.textInputAction,
              maxLength: widget.maxLength ?? 250,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefix: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(widget.prefix ?? "")),
                  hintText: widget.hintText,
                  counterText: "",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  )),
              style: AppStyle.regularDarkText,
            ),
          ),
          Visibility(
              visible: widget.actionIcon != null && text.isNotEmpty,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    switch (widget.actionType) {
                      case "clear":
                        text = "";
                        break;
                      case "toggle_password":
                        _isPasswordField = !_isPasswordField;
                        break;
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    widget.actionIcon,
                    color: MyColor.primary,
                    size: 20,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
