import 'package:flutter/material.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: AppDimens.large * 1.2),
      child: SizedBox(
        height: AppDimens.large,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Container(
                height: size.height / 40,
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.verySmall),
                margin:
                    const EdgeInsets.symmetric(horizontal: AppDimens.verySmall),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.tagListBackGround),
                child: Center(
                    child: Text(
                  'شیائومی',
                  style: AppTextStyle.tagName,
                )),
              );
            }),
      ),
    );
  }
}
