import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.buttonBackGround),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.verySmall))));
}
