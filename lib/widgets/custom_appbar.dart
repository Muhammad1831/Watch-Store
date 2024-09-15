import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.size, required this.child});

  final Size size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
            height: preferredSize.height,
            decoration: const BoxDecoration(
                color: AppColor.appBarBackGround,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppDimens.small)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -2),
                      blurRadius: 10,
                      blurStyle: BlurStyle.normal,
                      color: AppColor.appBarShadow)
                ]),
            child: child));
  }

  @override
  Size get preferredSize => Size(size.width, size.height / 14);
}
