import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, this.numberOfProductsInBasket = 0});

  final int numberOfProductsInBasket;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: numberOfProductsInBasket == 0 ? false : true,
      child: Positioned(
        top: AppDimens.verySmall * 0.75,
        right: AppDimens.verySmall * 0.75,
        child: Container(
          height: AppDimens.medium,
          width: AppDimens.medium,
          decoration: const BoxDecoration(
              color: AppColor.notifBackGround, shape: BoxShape.circle),
          child: Center(
              child: FittedBox(
            fit: BoxFit.contain,
            child: DefaultTextStyle(
              style: AppTextStyle.numberOfProductsInBasket,
              child: Text(
                numberOfProductsInBasket.toString(),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
