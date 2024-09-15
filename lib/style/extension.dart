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

extension FormatTime on int {
  String formatTimer() {
    // var minute = startTime ~/ 60;
    // var seconds = startTime % 60;

    // String time =
    //     '${minute.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
    Duration duration = Duration(seconds: this);

    int h = duration.inHours;
    int m = duration.inMinutes.remainder(60);
    int s = duration.inSeconds.remainder(60);

    String time;

    if (duration.inSeconds >= 3600) {
      time = '$h : $m : $s';
    } else {
      time = '$m : $s';
    }

    return time;
  }
}

extension OffPrice on int {
  int offPrice(int offPercent) {
    return this * (100 - offPercent) ~/ 100;
  }
}

extension ConvertTimeToSecond on String {
  int convertTimeToSecond() {
    Duration duration = const Duration();
    DateTime now = DateTime.now();
    DateTime specialExpiration = DateTime.parse(this);

    duration = specialExpiration.difference(now);

    return duration.inSeconds;
  }
}
