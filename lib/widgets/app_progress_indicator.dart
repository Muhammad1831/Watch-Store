import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_color.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.circularProgressIndicatorColor,
      ),
    );
  }
}