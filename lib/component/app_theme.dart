import 'package:flutter/material.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightAppColor.primaryBackGround,
    primaryColor: LightAppColor.primary,
    iconTheme: const IconThemeData(
      color: LightAppColor.icon,
    ),
    // textfield input decoration theme
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppDimens.small),
        filled: true,
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return LightAppColor.focusedTextField;
          } else {
            return LightAppColor.unFocusedTextField;
          }
        }),
        enabledBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.verySmall)),
            borderSide: BorderSide(
                color: LightAppColor.textFieldBorderUnselected, width: 2)),
        focusedBorder: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimens.verySmall)),
            borderSide: BorderSide(
                color: LightAppColor.textFieldBorderSelected, width: 2))),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStateProperty.all(LightAppColor.buttonBackGround),
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
