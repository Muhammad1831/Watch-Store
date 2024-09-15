import 'package:flutter/material.dart';
import 'package:watch_store/route/screen_names.dart';
import 'package:watch_store/screens/authentication/enter_active_code_screen.dart';
import 'package:watch_store/screens/main_screen/main_screen.dart';
import 'package:watch_store/screens/product_details_screen/product_details_screen.dart';
import 'package:watch_store/screens/product_list_screen/product_list_screen.dart';
import 'package:watch_store/screens/register/register_screen.dart';
import 'package:watch_store/screens/authentication/enter_phone_screen.dart';
import 'package:watch_store/screens/search_screen/search_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.enterPhoneScreen: (context) => EnterPhoneScreen(),
  ScreenNames.enterActiveCodeScreen: (context) => EnterActiveCodeScreen(),
  ScreenNames.registerScreen: (context) => const RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productListScreen: (context) => const ProductListScreen(),
  ScreenNames.productDetailsScreen: (context) => const ProductDetailsScreen(),
  ScreenNames.searchScreen: (context) => const SearchScreen(),
};
