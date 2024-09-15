import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.primaryBackGround,
    primaryColor: AppColor.primary,
    iconTheme: const IconThemeData(
      color: AppColor.icon,
    ),
    // textfield input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppDimens.small),
        filled: true,
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return AppColor.focusedTextField;
          } else {
            return AppColor.unFocusedTextField;
          }
        }),
        enabledBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.verySmall)),
            borderSide: BorderSide(
                color: AppColor.textFieldBorderUnselected, width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.verySmall)),
            borderSide:
                BorderSide(color: AppColor.textFieldBorderSelected, width: 2))),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.verySmall))),
    )),
  );
}

// ThemeData darkThemeData() {
//   return ThemeData(
//       brightness: Brightness.light,
//       elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.red),
//               shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(Dimens.verySmall))))));
// }
