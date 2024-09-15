import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_dimens.dart';

// ignore: must_be_immutable
class ProductCategories extends StatelessWidget {
  ProductCategories({
    super.key,
    required this.productCategoryName,
    required this.productCategoryNameColor,
    required this.onTap,
  });

  final String productCategoryName;
  final Color productCategoryNameColor;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return RotatedBox(
      quarterTurns: -1,
      child: Padding(
        padding: EdgeInsets.only(top: size.width / 10, bottom: size.width / 20),
        child: Column(
          children: [
            // show all
            InkWell(
              onTap: onTap,
              splashFactory: InkRipple.splashFactory,
              child: SizedBox(
                width: size.height / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Transform.rotate(
                        angle: 1.5,
                        child: SvgPicture.asset(Assets.svg.directLeft)),
                    Text(
                      'نمایش همه',
                      style: AppTextStyle.titleMediumMed,
                    ),
                  ],
                ),
              ),
            ),
            AppDimens.medium.height,
            // category name
            Text(
              productCategoryName,
              style: AppTextStyle.productCategoryNameTextStyle
                  .copyWith(color: productCategoryNameColor),
            )
          ],
        ),
      ),
    );
  }
}
