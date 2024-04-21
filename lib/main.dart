import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/app_theme.dart';
import 'package:watch_store/route/routes.dart';
import 'package:watch_store/screens/authentication/cubit/authentication_cubit.dart';
import 'package:watch_store/screens/authentication/enter_phone_screen.dart';
import 'package:watch_store/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('fa'),
          theme: lightThemeData(),
          routes: routes,
          home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) {
              if (state is LoggedinState) {
                return const MainScreen();
              } else if (state is LoggedoutState) {
                return EnterPhoneScreen();
              } else {
                return EnterPhoneScreen();
              }
            },
          )),
    );
  }
}
