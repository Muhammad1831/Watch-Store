import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/data/repository/cart_repository.dart';
import 'package:watch_store/data/repository/product_repository.dart';
import 'package:watch_store/screens/basket_screen/bloc/basket_bloc.dart';
import 'package:watch_store/screens/search_screen/bloc/search_bloc.dart';
import 'package:watch_store/style/app_theme.dart';
import 'package:watch_store/route/routes.dart';
import 'package:watch_store/screens/authentication/cubit/authentication_cubit.dart';
import 'package:watch_store/screens/authentication/enter_phone_screen.dart';
import 'package:watch_store/screens/main_screen/main_screen.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesManager().initional();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final BasketBloc basketBloc =
                BasketBloc(cartRepository: cartRepository);
            basketBloc.add(BasketCountProductEvent());
            return basketBloc;
          },
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider(
          create: (context) =>
              SearchBloc(productRepository: productListRepository),
        )
      ],
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
