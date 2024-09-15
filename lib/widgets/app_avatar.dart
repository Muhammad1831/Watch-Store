import 'package:flutter/material.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_dimens.dart';

// ignore: must_be_immutable
class AppAvatar extends StatelessWidget {
  AppAvatar(
      {super.key,
      required this.avatarTitle,
      required this.ontap,
      required this.imageFile});

  final String avatarTitle;
  void Function() ontap;
  final dynamic imageFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          // avatar image
          SizedBox(
            height: size.height / 11.9,
            width: size.height / 11.9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: imageFile == null
                  ? Image.asset(Assets.png.avatar.path)
                  : Image.file(imageFile),
            ),
          ),
          AppDimens.medium.height,
          // title for avatar
          Text(
            avatarTitle,
            style: AppTextStyle.chooseProfileImage,
          ),
        ],
      ),
    );
  }
}
