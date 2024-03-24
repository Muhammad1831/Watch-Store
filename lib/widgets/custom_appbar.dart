import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leftIcon = const SizedBox.shrink(),
  });

  final String title;
  final Widget leftIcon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PreferredSize(
        preferredSize: Size(double.maxFinite, size.height / 12.8),
        child: Container(
          height: size.height / 12.8,
          width: size.width,
          decoration: const BoxDecoration(
              color: LightAppColor.appBarBackGround,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(AppDimens.small)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -2),
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                    color: LightAppColor.appBarShadow)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimens.verySmall, right: AppDimens.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: leftIcon),
                Text(
                  title,
                  style: AppTextStyle.titleMediumMed,
                ),
              ],
            ),
          ),
        ));
  }
}
