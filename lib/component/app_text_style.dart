import 'package:flutter/material.dart';
import 'package:watch_store/resource/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle titleSmallReg = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColor.title,
  );
  static TextStyle titleSmallBol = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.title,
  );

  static TextStyle titleMediumMed = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.title,
  );

  static TextStyle titleMediumReg = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColor.title,
  );

  static TextStyle bodySmallMed = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.title,
  );

  static TextStyle hintSmallReg = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.hintTextFeild);

  static TextStyle hintMediumReg = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColor.hintTextFeild);

  static TextStyle hintLargeReg = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColor.hintTextFeild);

  static TextStyle buttonText = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColor.buttonText);

  static TextStyle numberIsWrongEditing = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.primary);

  static TextStyle chooseProfileImage = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.title);

  static TextStyle bottomNavUnactiveIcon = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.bottomNavUnactiveIcon);

  static TextStyle bottomNavActiveIcon = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.bottomNavActiveIcon);

  static TextStyle hintSearchBar = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.hintSearchBar);

  static TextStyle oldPrice = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.oldPrice,
      decoration: TextDecoration.lineThrough,
      decorationColor: AppColor.oldPrice);

  static TextStyle offPercent = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColor.buttonText);

  static TextStyle productTimer = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColor.primary);

  static TextStyle productCategoryNameTextStyle = const TextStyle(
    fontFamily: 'iransansx',
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );

  static TextStyle numberOfProductsInBasket = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColor.numberOfProductsInBasket);

  static TextStyle tagName = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColor.numberOfProductsInBasket);

  static TextStyle withOff = const TextStyle(
      fontFamily: 'iransansx',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.primary);
}
