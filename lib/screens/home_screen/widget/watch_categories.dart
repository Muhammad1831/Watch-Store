import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/resource/app_dimens.dart';

// ignore: must_be_immutable
class WatchCategories extends StatelessWidget {
  WatchCategories(
      {super.key,
      required this.gradientCategory,
      required this.nameCategory,
      required this.imageCategory,
      required this.onTap});

  final List<Color> gradientCategory;
  final String nameCategory;
  final String imageCategory;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size.height / 9.7,
        child: Column(
          children: [
            Container(
              height: size.height / 14,
              width: size.height / 14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: gradientCategory)),
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.verySmall * 0.75),
                child: SvgPicture.asset(imageCategory),
              ),
            ),
            (AppDimens.verySmall / 2).height,
            Text(
              nameCategory,
              style: AppTextStyle.titleMediumMed,
            )
          ],
        ),
      ),
    );
  }
}
