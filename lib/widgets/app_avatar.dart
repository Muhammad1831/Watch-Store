import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_dimens.dart';

class AppAvatar extends StatelessWidget {
  const AppAvatar({super.key, required this.avatarTitle});

  final String avatarTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // avatar image
        SizedBox(
          height: size.height / 11.9,
          width: size.height / 11.9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(Assets.png.avatar.path),
          ),
        ),
        AppDimens.medium.height,
        // title for avatar
        Text(
          avatarTitle,
          style: AppTextStyle.chooseProfileImage,
        ),
      ],
    );
  }
}
