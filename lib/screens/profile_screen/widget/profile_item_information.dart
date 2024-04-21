import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/resource/app_dimens.dart';

class ProfileItemInformation extends StatelessWidget {
  const ProfileItemInformation({
    super.key,
    required this.content,
    required this.icon,
  });

  final String content;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          content,
          style: AppTextStyle.titleSmallBol,
        ),
        AppDimens.verySmall.width,
        SvgPicture.asset(icon),
      ],
    );
  }
}