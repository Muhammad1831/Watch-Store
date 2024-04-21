import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/screens/product_list_screen/widget/tag_list.dart';
import 'package:watch_store/widgets/custom_appbar.dart';
import 'package:watch_store/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              size: size,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: AppDimens.large * 1.4,
                          width: size.width / 8,
                        ),
                        SvgPicture.asset(Assets.svg.bascket),
                        const CartBadge(
                          numberOfProductsInBasket: 3,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppString.theBestSellers,
                          style: AppTextStyle.titleSmallBol,
                        ),
                        AppDimens.small.width,
                        SvgPicture.asset(Assets.svg.filter)
                      ],
                    ),
                    SvgPicture.asset(Assets.svg.close)
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppDimens.medium.height,
                  const TagList(),
                  (size.height / 18).height,
                  Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.medium),
                      child: GridView.builder(
                          itemCount: 10,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: AppDimens.small,
                                  mainAxisSpacing: AppDimens.medium,
                                  mainAxisExtent: 280,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return ProductItem(
                              image: Assets.png.productWatch.path,
                              modelName: 'اسکمی',
                              price: 150000,
                              offPercent: 35,
                              time: '10:24:37',
                            );
                          }),
                    ),
                  ),
                  AppDimens.large.height
                ],
              ),
            )));
  }
}
