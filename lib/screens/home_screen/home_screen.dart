import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/screens/search_screen/search_screen.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/data/repository/home_repository.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_cubit.dart';
import 'package:watch_store/screens/home_screen/bloc/home_bloc.dart';
import 'package:watch_store/screens/home_screen/widget/custom_search_bar.dart';
import 'package:watch_store/screens/home_screen/widget/custom_slider.dart';
import 'package:watch_store/screens/home_screen/widget/product_categories.dart';
import 'package:watch_store/screens/home_screen/widget/watch_categories.dart';
import 'package:watch_store/screens/product_list_screen/product_list_screen.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/product_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Color> categoryGradient(int item) {
    List<Color>? gradient;

    switch (item) {
      case 1:
        gradient = AppColor.digitalWatchCategoryGradient;
        break;
      case 2:
        gradient = AppColor.smartWatchCategoryGradient;
        break;
      case 3:
        gradient = AppColor.classicWatchCategoryGradient;
        break;
      case 4:
        gradient = AppColor.desktopWatchCategoryGradient;
        break;
    }
    return gradient!;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final homeBloc = HomeBloc(homeRepository);
              homeBloc.add(HomeInitial());
              return homeBloc;
            },
          ),
          BlocProvider(create: (context) => CountDownCubit()),
        ],
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
                child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeError) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('خطای سرور'),
                    backgroundColor: AppColor.errorSnackBarBackGround,
                  ));
                }
              },
              builder: (context, state) {
                if (state is HomeLoding) {
                  return const AppProgressIndicator();
                } else if (state is HomeLoaded) {
                  return Column(
                    children: [
                      // search bar
                      CustomSearchBar(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const SearchScreen(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    var tween = Tween<Offset>(
                                            begin: const Offset(0.0, 1.0),
                                            end: Offset.zero)
                                        .chain(CurveTween(curve: Curves.ease));
                                    final offsetAnimation =
                                        animation.drive(tween);
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                  reverseTransitionDuration:
                                      const Duration(milliseconds: 400),
                                  transitionDuration:
                                      const Duration(milliseconds: 400)));
                        },
                      ),
                      (AppDimens.large * 1.5).height,
                      // sliders
                      CustomSlider(imageList: state.home.slider),
                      (AppDimens.large * 1.5).height,
                      // watch categories
                      SizedBox(
                          height: size.height / 9,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              itemCount: state.home.categories.length,
                              itemBuilder: (context, item) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDimens.small),
                                  child: WatchCategories(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return ProductListScreen(
                                                id: state
                                                    .home.categories[item].id);
                                          },
                                        ));
                                      },
                                      gradientCategory: categoryGradient(
                                          state.home.categories[item].id),
                                      nameCategory:
                                          state.home.categories[item].title,
                                      imageCategory:
                                          state.home.categories[item].image),
                                );
                              })),
                      (AppDimens.large * 1.5).height,
                      // mostViewed list view
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: size.height / 2.95,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(
                                    parent: ScrollPhysics()),
                                shrinkWrap: true,
                                itemCount: state.home.amazingProducts.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppDimens.medium),
                                    child: ProductItem(
                                      product:
                                          state.home.amazingProducts[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                            // mostViewed and show all
                            ProductCategories(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductListScreen(
                                          sortBy: SortBy.mostViewedProducts,
                                        )));
                              },
                              productCategoryName: AppString.mostViewed,
                              productCategoryNameColor:
                                  AppColor.amazingCategory,
                            )
                          ],
                        ),
                      ),
                      (AppDimens.large * 1.5).height,
                      // home banner
                      SizedBox(
                        height: size.height / 4.3,
                        width: size.width / 1.2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimens.small),
                          child: Image.asset(
                            Assets.png.watch3.path,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      (AppDimens.large * 1.5).height,
                      // cheapest list view
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: size.height / 2.95,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(
                                    parent: ScrollPhysics()),
                                shrinkWrap: true,
                                itemCount: state.home.mostSellerProducts.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppDimens.medium),
                                    child: ProductItem(
                                        product: state
                                            .home.mostSellerProducts[index]),
                                  );
                                },
                              ),
                            ),
                            // cheapest and show all
                            ProductCategories(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductListScreen(
                                          sortBy: SortBy.cheapestProducts,
                                        )));
                              },
                              productCategoryName: AppString.cheapest,
                              productCategoryNameColor:
                                  AppColor.bestSellersCategory,
                            )
                          ],
                        ),
                      ),
                      (AppDimens.large * 1.5).height,
                      // newest list view
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: size.height / 2.95,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ClampingScrollPhysics(
                                    parent: ScrollPhysics()),
                                shrinkWrap: true,
                                itemCount: state.home.newestProducts.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppDimens.medium),
                                    child: ProductItem(
                                      product: state.home.newestProducts[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                            // newest and show all
                            ProductCategories(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductListScreen(
                                          sortBy: SortBy.newestProducts,
                                        )));
                              },
                              productCategoryName: AppString.newest,
                              productCategoryNameColor: AppColor.newestCategory,
                            )
                          ],
                        ),
                      ),
                      (AppDimens.large * 1.5).height,
                    ],
                  );
                } else {
                  throw Exception('invalid error');
                }
              },
            )),
          ),
        ),
      ),
    );
  }
}
