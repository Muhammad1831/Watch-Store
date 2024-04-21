import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/screens/home_screen/widget/custom_search_bar.dart';
import 'package:watch_store/screens/home_screen/widget/custom_slider.dart';
import 'package:watch_store/screens/home_screen/widget/product_categories.dart';
import 'package:watch_store/screens/home_screen/widget/watch_categories.dart';
import 'package:watch_store/screens/product_list_screen/product_list_screen.dart';
import 'package:watch_store/widgets/product_item.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // search bar
              CustomSearchBar(
                onTap: () {},
              ),
              (AppDimens.large * 1.5).height,
              // sliders
              const CustomSlider(),
              (AppDimens.large * 1.5).height,
              // watch categories
              Padding(
                padding: EdgeInsets.only(
                    left: size.width / 11.8, right: size.width / 11.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WatchCategories(
                        onTap: () {},
                        gradientCategory: AppColor.desktopWatchCategoryGradient,
                        nameCategory: AppString.desktop,
                        imageCategory: Assets.svg.desktop),
                    WatchCategories(
                        onTap: () {},
                        gradientCategory: AppColor.digitalWatchCategoryGradient,
                        nameCategory: AppString.digital,
                        imageCategory: Assets.svg.digital),
                    WatchCategories(
                        onTap: () {},
                        gradientCategory: AppColor.smartWatchCategoryGradient,
                        nameCategory: AppString.smart,
                        imageCategory: Assets.svg.smart),
                    WatchCategories(
                        onTap: () {},
                        gradientCategory: AppColor.classicWatchCategoryGradient,
                        nameCategory: AppString.classic,
                        imageCategory: Assets.svg.classic),
                  ],
                ),
              ),
              (AppDimens.large * 1.5).height,
              // amazing list view
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
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: AppDimens.medium),
                            child: ProductItem(
                              image: Assets.png.productWatch.path,
                              modelName: 'ساعت مردانه اسکمی',
                              price: 112000,
                              offPercent: 20,
                              time: '09:26:22',
                            ),
                          );
                        },
                      ),
                    ),
                    // amazing and show all
                    ProductCategories(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProductListScreen()));
                      },
                      productCategoryName: AppString.amazing,
                      productCategoryNameColor: AppColor.amazingCategory,
                    )
                  ],
                ),
              ),
              (AppDimens.large * 1.5).height,
              // best sellers list view
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
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: AppDimens.medium),
                            child: ProductItem(
                              image: Assets.png.productWatch.path,
                              modelName: 'ساعت مردانه اسکمی',
                              price: 112000,
                              time: '09:26:22',
                            ),
                          );
                        },
                      ),
                    ),
                    // best sellers and show all
                    ProductCategories(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProductListScreen()));
                      },
                      productCategoryName: AppString.bestsellers,
                      productCategoryNameColor: AppColor.bestSellersCategory,
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
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: AppDimens.medium),
                            child: ProductItem(
                              image: Assets.png.productWatch.path,
                              modelName: 'ساعت مردانه اسکمی',
                              price: 112000,
                            ),
                          );
                        },
                      ),
                    ),
                    // newest and show all
                    ProductCategories(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProductListScreen()));
                      },
                      productCategoryName: AppString.newest,
                      productCategoryNameColor: AppColor.newestCategory,
                    )
                  ],
                ),
              ),
              (AppDimens.large * 1.5).height,
            ],
          ),
        ),
      ),
    ));
  }
}
