import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';

// ignore: must_be_immutable
class AppElevatedButton extends StatelessWidget {
  AppElevatedButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      required this.height,
      required this.width,
      required this.buttonColor});

  final String buttonName;
  void Function() onPressed;
  final double height;
  final double width;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle()
            .copyWith(backgroundColor: MaterialStateProperty.all(buttonColor)),
        child: Text(
          buttonName,
          style: AppTextStyle.buttonText,
        ),
      ),
    );
  }
}
