import 'package:flutter/material.dart';

abstract class AppColor {
  AppColor._();

  static const Color primary = Color.fromARGB(255, 0, 117, 251);
  static const Color surface = Color.fromARGB(255, 243, 243, 243);
  static const Color title = Color.fromARGB(255, 0, 0, 0);
  static const Color icon = Color.fromARGB(255, 0, 0, 0);
  static const Color buttonText = Color.fromARGB(255, 255, 255, 255);
  static const Color buttonBackGround = Color.fromARGB(255, 0, 117, 251);
  static const Color buttonBackGroundSecondary =
      Color.fromARGB(255, 255, 97, 97);
  static const Color primaryBackGround = Color.fromARGB(255, 255, 255, 255);
  static const Color secondaryBackGround = Color.fromARGB(255, 251, 251, 251);
  static const Color appBarBackGround = Color.fromARGB(255, 255, 255, 255);
  static const Color appBarShadow = Color.fromARGB(125, 112, 112, 112);
  static const Color searchBarBackGround = Color.fromARGB(255, 255, 255, 255);
  static const Color bottomNavBackGround = Color.fromARGB(255, 255, 255, 255);
  static const Color bottomNavActiveIcon = Color.fromARGB(255, 0, 0, 0);
  static const Color bottomNavUnactiveIcon = Color.fromARGB(255, 206, 206, 206);
  static const Color textFieldBorderUnselected =
      Color.fromARGB(255, 217, 220, 228);
  static const Color textFieldBorderSelected = Color.fromARGB(255, 0, 117, 251);
  static const Color unFocusedTextField = Color.fromARGB(255, 251, 251, 251);
  static const Color focusedTextField = Color.fromARGB(255, 255, 255, 255);
  static const Color hintTextFeild = Color.fromARGB(255, 217, 220, 228);
  static const Color hintLocationTextField = Color.fromARGB(255, 136, 141, 155);
  static const Color hintSearchBar = Color.fromARGB(255, 171, 171, 171);
  static const Color activeIndicator = Color.fromARGB(255, 193, 193, 193);
  static const Color unActiveIndicator = Color.fromARGB(255, 255, 255, 255);
  static const Color borderIndicator = Color.fromARGB(255, 112, 112, 112);
  static const Color oldPrice = Color.fromARGB(255, 191, 191, 191);
  static const Color offBackGround = Color.fromARGB(255, 255, 58, 58);
  static const Color offPercent = Color.fromARGB(255, 255, 255, 255);
  static const Color dividerBlue = Color.fromARGB(255, 0, 117, 251);
  static const Color amazingCategory = Color.fromARGB(255, 57, 24, 80);
  static const Color bestSellersCategory = Color.fromARGB(255, 207, 39, 85);
  static const Color newestCategory = Color.fromARGB(255, 119, 119, 119);
  static const Color notifBackGround = Color.fromARGB(255, 255, 0, 0);
  static const Color numberOfProductsInBasket =
      Color.fromARGB(255, 255, 255, 255);
  static const Color tagListBackGroundUnselected = Color.fromARGB(255, 0, 176, 251);
  static const Color tagListBackGroundSelected = Color.fromARGB(255, 4, 0, 251);
  static const Color tagName = Color.fromARGB(255, 255, 255, 255);
  static const Color dividerGreyLight = Color.fromARGB(255, 248, 248, 248);
  static const Color dividerGreyDark = Color.fromARGB(255, 217, 220, 228);
  static const Color addToBasketNavigationBackGround =
      Color.fromARGB(255, 255, 255, 255);
  static const Color errorSnackBarBackGround = Color.fromARGB(255, 255, 0, 0);
  static const Color successSnackBarBackGround = Color.fromARGB(255, 10, 222, 31);
  static const Color circularProgressIndicatorColor = Color.fromARGB(255, 0, 117, 251);


  // gradients
  static const List<Color> classicWatchCategoryGradient = [
    Color.fromARGB(255, 255, 227, 200),
    Color.fromARGB(255, 255, 166, 114)
  ];
  static const List<Color> smartWatchCategoryGradient = [
    Color.fromARGB(255, 223, 238, 245),
    Color.fromARGB(255, 98, 144, 156)
  ];
  static const List<Color> digitalWatchCategoryGradient = [
    Color.fromARGB(255, 255, 230, 245),
    Color.fromARGB(255, 225, 131, 212)
  ];
  static const List<Color> desktopWatchCategoryGradient = [
    Color.fromARGB(255, 230, 252, 255),
    Color.fromARGB(255, 131, 150, 225)
  ];
  static const List<Color> productWatchGradient = [
    Color.fromARGB(255, 238, 238, 238),
    Color.fromARGB(255, 255, 255, 255)
  ];
}
