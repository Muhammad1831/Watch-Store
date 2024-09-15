import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/constant/app_color.dart';

// ignore: must_be_immutable
class BottomNavItem extends StatelessWidget {
  BottomNavItem(
      {super.key,
      required this.iconPath,
      required this.iconLabel,
      required this.isActive,
      required this.onTap});

  final String iconPath;
  final String iconLabel;
  final bool isActive;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size.height / 17,
        width: size.width / 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(iconPath,
                colorFilter: ColorFilter.mode(
                    isActive
                        ? AppColor.bottomNavActiveIcon
                        : AppColor.bottomNavUnactiveIcon,
                    BlendMode.srcIn)),
            DefaultTextStyle(
              style: isActive
                  ? AppTextStyle.bottomNavActiveIcon
                  : AppTextStyle.bottomNavUnactiveIcon,
              child: Text(iconLabel),
            )
          ],
        ),
      ),
    );
  }
}
