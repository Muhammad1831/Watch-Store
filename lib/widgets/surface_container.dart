import 'package:flutter/material.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

class SurfaceContainer extends StatelessWidget {
  const SurfaceContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(
            AppDimens.verySmall, 0, AppDimens.verySmall, AppDimens.verySmall),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(AppDimens.medium),
        ),
        child: child);
  }
}
