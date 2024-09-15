import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_store/data/repository/cart_repository.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cartRepository.countBasketProducts,
      builder: (context, value, child) {
        return Visibility(
          visible: value == 0 ? false : true,
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
                    value.toString(),
                  ),
                ),
              )),
            ),
          ),
        );
      },
    );
  }
}
