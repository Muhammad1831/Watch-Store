import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/screens/basket_screen/basket_screen.dart';
import 'package:watch_store/screens/basket_screen/bloc/basket_bloc.dart';
import 'package:watch_store/screens/home_screen/home_screen.dart';
import 'package:watch_store/screens/main_screen/widget/bottom_nav_item.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/screens/profile_screen/profile_screen.dart';

class BottomNavItemSelected {
  static const int home = 0;
  static const int basket = 1;
  static const int profile = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int itemSelected = BottomNavItemSelected.home;

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final Map map = {
    BottomNavItemSelected.home: _homeKey,
    BottomNavItemSelected.basket: _basketKey,
    BottomNavItemSelected.profile: _profileKey,
  };

  List<int> bottomNavRouteTraveled = [BottomNavItemSelected.home];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double bottomNavHeight = size.height / 10.3;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (map[itemSelected].currentState!.canPop()) {
          map[itemSelected].currentState!.pop();
        } else if (bottomNavRouteTraveled.length > 1) {
          bottomNavRouteTraveled.removeLast();
          selectItem(bottomNavRouteTraveled.last);
        }
      },
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: bottomNavHeight,
                child: IndexedStack(
                  index: itemSelected,
                  children: [
                    Navigator(
                        key: _homeKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            )),
                    Navigator(
                        key: _basketKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => const BasketScreen())),
                    Navigator(
                        key: _profileKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            )),
                  ],
                )),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: bottomNavHeight,
                  color: AppColor.bottomNavBackGround,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BottomNavItem(
                          onTap: () {
                            bottomNavRouteTraveled
                                .add(BottomNavItemSelected.profile);
                            selectItem(BottomNavItemSelected.profile);
                          },
                          isActive:
                              itemSelected == BottomNavItemSelected.profile,
                          iconPath: Assets.svg.user,
                          iconLabel: AppString.profile),
                      Stack(
                        children: [
                          BottomNavItem(
                              onTap: () {
                                bottomNavRouteTraveled
                                    .add(BottomNavItemSelected.basket);
                                selectItem(BottomNavItemSelected.basket);
                                BlocProvider.of<BasketBloc>(context)
                                    .add(BasketInitialEvent());
                              },
                              isActive:
                                  itemSelected == BottomNavItemSelected.basket,
                              iconPath: Assets.svg.bascket,
                              iconLabel: AppString.bascket),
                          const CartBadge(),
                        ],
                      ),
                      BottomNavItem(
                          onTap: () {
                            bottomNavRouteTraveled
                                .add(BottomNavItemSelected.home);
                            selectItem(BottomNavItemSelected.home);
                          },
                          isActive: itemSelected == BottomNavItemSelected.home,
                          iconPath: Assets.svg.home,
                          iconLabel: AppString.home),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void selectItem(int index) {
    setState(() {
      itemSelected = index;
    });
  }
}
