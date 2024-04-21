import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/resource/app_string.dart';

class ShoppingProductItem extends StatelessWidget {
  const ShoppingProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDimens.small.height,
              // product name
              Text(
                'ساعت شیائومی mi Watch lite',
                style: AppTextStyle.titleSmallBol,
              ),
              AppDimens.medium.height,
              // product price
              Text(
                '${AppString.price} : ${'122000'.englishToPersion} تومان',
                style: AppTextStyle.titleMediumMed
                    .copyWith(color: const Color.fromARGB(255, 136, 141, 155)),
              ),
              (AppDimens.verySmall / 2).height,
              // product price with off
              Text(
                '${AppString.withOff} : ${'85000'.englishToPersion} تومان',
                style: AppTextStyle.withOff,
              ),
              AppDimens.medium.height,
              // divider
              SizedBox(
                width: size.width / 1.8,
                child: const Divider(
                  color: AppColor.dividerGreyDark,
                  indent: AppDimens.verySmall,
                  height: 0,
                  thickness: 2,
                ),
              ),
              AppDimens.medium.height,
              // plus & minus & delete icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.delete,
                          height: size.height / 35)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.minus,
                              height: size.height / 35)),
                      Text(
                        '${'1'.englishToPersion} عدد',
                        style: AppTextStyle.titleMediumMed,
                        textDirection: TextDirection.rtl,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.svg.plus,
                            height: size.height / 35,
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        // product image
        Image.asset(
          Assets.png.productWatch2.path,
          height: size.height / 8,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
