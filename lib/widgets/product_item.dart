import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.modelName,
    required this.price,
    this.offPercent = 0,
    this.time = '',
  });

  final String image;
  final String modelName;
  final int price;
  final int offPercent;
  final String time;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width / 2.2,
        padding: const EdgeInsets.all(AppDimens.verySmall),
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(AppDimens.small),
            gradient: const LinearGradient(
                colors: AppColor.productWatchGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            // watch image
            Image.asset(
              image,
              height: size.height / 6.5,
            ),
            // model watch
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                modelName,
                style: AppTextStyle.titleMediumMed,
              ),
            ),
            AppDimens.large.height,
            // price and off
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            AppDimens.small.height,
            // divider
            Visibility(
              visible: time == '' ? false : true,
              child: const Divider(
                height: 1,
                color: AppColor.dividerBlue,
                endIndent: AppDimens.medium,
                indent: AppDimens.medium,
              ),
            ),
            // amazing timer
            AppDimens.verySmall.height,
            Visibility(
              visible: time == '' ? false : true,
              child: Text(
                time,
                style: AppTextStyle.productTimer,
              ),
            )
          ],
        ));
  }
}
