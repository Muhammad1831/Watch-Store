import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/screens/basket_screen/bloc/basket_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';

class AddToBasketNavigation extends StatelessWidget {
  const AddToBasketNavigation({
    super.key,
    required this.productId,
    required this.price,
    required this.discountPrice,
    this.offPercent = 0,
  });

  final int productId;
  final int price;
  final int discountPrice;
  final int offPercent;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 14,
      decoration: const BoxDecoration(
        color: AppColor.addToBasketNavigationBackGround,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${discountPrice.separateThreeDigits} تومان'
                          .englishToPersion,
                      style: AppTextStyle.titleSmallReg,
                    ),
                    Visibility(
                      visible: offPercent == 0 ? false : true,
                      child: Text(
                        price.separateThreeDigits.englishToPersion,
                        style: AppTextStyle.oldPrice,
                      ),
                    )
                  ],
                ),
                AppDimens.medium.width,
                Visibility(
                  visible: offPercent == 0 ? false : true,
                  child: Container(
                    height: size.height / 36,
                    padding: const EdgeInsets.only(
                        left: AppDimens.verySmall, right: AppDimens.verySmall),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColor.offBackGround),
                    child: Center(
                      child: Text(
                        '$offPercent %'.englishToPersion,
                        style: AppTextStyle.offPercent,
                      ),
                    ),
                  ),
                )
              ],
            ),
            // add to basket button
            BlocConsumer<BasketBloc, BasketState>(
              listener: (context, state) {
                if (state is BasketAddState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: const Duration(milliseconds: 1000),
                    content: Text(
                      '.با موفقیت به سبد خرید اضافه شد',
                      style: AppTextStyle.buttonText,
                    ),
                    backgroundColor: AppColor.successSnackBarBackGround,
                  ));
                }
              },
              builder: (context, state) {
                if (state is BasketLodingState) {
                  return SizedBox(
                      height: size.height / 25,
                      width: size.width / 2.5,
                      child: const AppProgressIndicator());
                }
                return AppElevatedButton(
                  height: size.height / 25,
                  width: size.width / 2.5,
                  buttonColor: AppColor.buttonBackGround,
                  buttonName: AppString.addToBasket,
                  onPressed: () {
                    BlocProvider.of<BasketBloc>(context)
                        .add(BasketAddEvent(productId: productId));
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
