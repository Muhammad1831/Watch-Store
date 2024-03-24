import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';

// ignore: must_be_immutable
class AppElevatedButton extends StatelessWidget {
  AppElevatedButton(
      {super.key, required this.buttonName, required this.onPressed});

  final String buttonName;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 18,
      width: size.width / 1.5,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: AppTextStyle.buttonText,
        ),
      ),
    );
  }
}
