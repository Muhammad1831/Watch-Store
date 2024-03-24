import 'package:flutter/material.dart';
import 'package:watch_store/component/app_theme.dart';
import 'package:watch_store/screens/confirm_code_screen.dart';
import 'package:watch_store/screens/register_screen.dart';
import 'package:watch_store/screens/send_code_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('fa'),
        theme: lightThemeData(),
        home: RegisterScreen());
  }
}
