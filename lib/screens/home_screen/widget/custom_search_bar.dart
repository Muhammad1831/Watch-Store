import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, required this.onTap});

  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
          left: AppDimens.large * 1.5,
          right: AppDimens.large * 1.5,
          top: AppDimens.large * 1.5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: size.height / 16.5,
          width: size.width / 1.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColor.searchBarBackGround,
              boxShadow: const [
                BoxShadow(
                    color: AppColor.appBarShadow,
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    blurStyle: BlurStyle.normal)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.svg.search),
              Text(
                AppString.searchProduct,
                style: AppTextStyle.hintSearchBar,
              ),
              Image.asset(
                Assets.png.logo.path,
                height: size.height / 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
