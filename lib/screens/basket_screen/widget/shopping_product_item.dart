import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/models/cart_model.dart';
import 'package:watch_store/screens/basket_screen/bloc/basket_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';

class ShoppingProductItem extends StatefulWidget {
  const ShoppingProductItem({
    required this.userCart,
    super.key,
  });

  final UserCart userCart;

  @override
  State<ShoppingProductItem> createState() => _ShoppingProductItemState();
}

class _ShoppingProductItemState extends State<ShoppingProductItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDimens.small.height,
              // product name
              Text(
                widget.userCart.product!,
                style: AppTextStyle.titleSmallBol,
              ),
              AppDimens.medium.height,
              // product price
              Text(
                '${AppString.price} : ${widget.userCart.price} تومان'
                    .englishToPersion,
                style: AppTextStyle.titleMediumMed
                    .copyWith(color: const Color.fromARGB(255, 136, 141, 155)),
              ),
              (AppDimens.verySmall / 2).height,
              // product price with off
              Text(
                '${AppString.withOff} : ${widget.userCart.discountPrice} تومان'
                    .englishToPersion,
                style: AppTextStyle.withOff,
              ),
              AppDimens.medium.height,
              // divider
              SizedBox(
                width: size.width / 1.8,
                child: const Divider(
                  color: AppColor.dividerGreyDark,
                  indent: AppDimens.verySmall,
                  height: 0,
                  thickness: 2,
                ),
              ),
              AppDimens.medium.height,
              // plus & minus & delete icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // delete from basket
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<BasketBloc>(context).add(
                            BasketDeleteEvent(
                                productId: widget.userCart.productId));
                      },
                      icon: SvgPicture.asset(Assets.svg.delete,
                          height: size.height / 35)),
                  Row(
                    children: [
                      // remove from basket
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.userCart.isLoading = true;
                            });
                            BlocProvider.of<BasketBloc>(context).add(
                                BasketRemoveEvent(
                                    productId: widget.userCart.productId));
                          },
                          icon: SvgPicture.asset(Assets.svg.minus,
                              height: size.height / 35)),
                      widget.userCart.isLoading
                          ? const SizedBox(
                              height: AppDimens.large,
                              width: AppDimens.large,
                              child: AppProgressIndicator(),
                            )
                          : Text(
                              '${widget.userCart.count} عدد'.englishToPersion,
                              style: AppTextStyle.titleMediumMed,
                              textDirection: TextDirection.rtl,
                            ),

                      // add to basket
                      IconButton(
                          onPressed: () {
                            setState(() {
                              widget.userCart.isLoading = true;
                            });
                            BlocProvider.of<BasketBloc>(context).add(
                                BasketAddEvent(
                                    productId: widget.userCart.productId));
                          },
                          icon: SvgPicture.asset(
                            Assets.svg.plus,
                            height: size.height / 35,
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        // product image
        Image.network(
          widget.userCart.image!,
          height: size.height / 8,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
