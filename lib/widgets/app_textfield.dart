import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/resource/app_dimens.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField(
      {super.key,
      required this.label,
      this.labelStyle,
      this.prefixLabel = '',
      required this.hint,
      this.hintStyle,
      required this.textEditingController,
      this.textAlign = TextAlign.center,
      this.icon = const SizedBox.shrink(),
      this.inputType});

  final String label;
  final TextStyle? labelStyle;
  final String prefixLabel;
  final String hint;
  final TextStyle? hintStyle;
  TextEditingController textEditingController;
  final TextAlign textAlign;
  final Widget icon;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // textField label & prefixLabel
        SizedBox(
          width: size.width / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                prefixLabel,
                style: labelStyle,
              ),
              Text(label, style: labelStyle),
            ],
          ),
        ),
        AppDimens.small.height,
        // textField
        SizedBox(
          height: size.height / 18,
          width: size.width / 1.5,
          child: TextField(
            controller: textEditingController,
            textAlign: textAlign,
            keyboardType: inputType,
            decoration: InputDecoration(
                hintStyle: hintStyle, hintText: hint, prefixIcon: icon),
          ),
        )
      ],
    );
  }
}
