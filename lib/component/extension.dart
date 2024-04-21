import 'package:flutter/material.dart';

extension SizedBoxExtension on double {
  SizedBox get height => SizedBox(
        height: this,
      );
  SizedBox get width => SizedBox(
        width: this,
      );
}

extension PersionNumberExtension on String {
  String get englishToPersion {
    String englishNumber = this;

    List en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    List fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

    for (var element in en) {
      englishNumber =
          englishNumber.replaceAll(element, fa[en.indexOf(element)]);
    }

    return englishNumber;
  }
}

extension SeparateThreeDigitsIntExtension on int {
  String get separateThreeDigits {
    int count = 0;
    int numberInt = this;
    String numberString = '';

    if (numberInt <= 0) {
      numberString = '0';
    }

    while (numberInt > 0) {
      numberString = '${numberInt % 10}$numberString';
      numberInt = numberInt ~/ 10;

      count++;

      if (count == 3 && numberInt > 0) {
        numberString = ',$numberString';
        count = 0;
      }
    }

    return numberString;
  }
}

extension OffPrice on int {
  int offPrice(int offPercent) {
    return this * (100 - offPercent) ~/ 100;
  }
}
