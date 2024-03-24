import 'package:flutter/material.dart';
import 'package:watch_store/resource/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle titleSmallReg = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: LightAppColor.title,
  );
  static TextStyle titleSmallBol = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: LightAppColor.title,
  );

  static TextStyle titleMediumMed = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: LightAppColor.title,
  );

  static TextStyle hintSmallReg = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: LightAppColor.hintTextFeild);

  static TextStyle hintMediumReg = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: LightAppColor.hintTextFeild);

  static TextStyle hintLargeReg = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: LightAppColor.hintTextFeild);

  static TextStyle buttonText = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: LightAppColor.buttonText);

  static TextStyle numberIsWrongEditing = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: LightAppColor.primary);

  static TextStyle chooseProfileImage = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: LightAppColor.title);
}
