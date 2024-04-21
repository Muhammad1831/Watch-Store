import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';

class AddToBasketNavigation extends StatelessWidget {
  const AddToBasketNavigation({
    super.key,
    required this.price,
    this.offPercent = 0,
  });

  final int price;
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
                      '${(price.offPrice(offPercent)).separateThreeDigits} تومان'
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
            AppElevatedButton(
              height: size.height / 25,
              width: size.width / 2.5,
              buttonColor: AppColor.buttonBackGround,
              buttonName: AppString.addToBasket,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
