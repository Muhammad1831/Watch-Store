import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/models/product_model.dart';
import 'package:watch_store/screens/product_details_screen/product_details_screen.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_cubit.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_state.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late int inSeconds;

  @override
  void initState() {
    super.initState();
    inSeconds = widget.product.specialExpiration.convertTimeToSecond();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(arguments: widget.product.id),
              builder: (context) => const ProductDetailsScreen()),
        );
      },
      child: Container(
          width: size.width / 2.2,
          padding: const EdgeInsets.all(AppDimens.verySmall),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.small),
              gradient: const LinearGradient(
                  colors: AppColor.productWatchGradient,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
          child: Column(
            children: [
              // watch image
              Image.network(
                widget.product.image,
                height: size.height / 6.5,
                fit: BoxFit.fill,
              ),
              // model watch
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.product.title,
                  style: AppTextStyle.titleMediumMed,
                  textDirection: TextDirection.rtl,
                ),
              ),
              AppDimens.large.height,
              // price and off
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          '${widget.product.discountPrice.separateThreeDigits} تومان'
                              .englishToPersion,
                          style: AppTextStyle.titleSmallReg,
                        ),
                      ),
                      Visibility(
                        visible: widget.product.discount == 0 ? false : true,
                        child: FittedBox(
                          child: Text(
                            widget.product.price.separateThreeDigits
                                .englishToPersion,
                            style: AppTextStyle.oldPrice,
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: widget.product.discount == 0 ? false : true,
                    child: Container(
                      height: size.height / 36,
                      padding: const EdgeInsets.only(
                          left: AppDimens.verySmall,
                          right: AppDimens.verySmall),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.offBackGround),
                      child: Center(
                        child: Text(
                          '${widget.product.discount} %'.englishToPersion,
                          style: AppTextStyle.offPercent,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AppDimens.verySmall.height,
              // divider
              Visibility(
                visible: inSeconds > 0 ? true : false,
                child: const Divider(
                  height: 1,
                  color: AppColor.dividerBlue,
                  endIndent: AppDimens.medium,
                  indent: AppDimens.medium,
                ),
              ),
              // amazing timer
              AppDimens.verySmall.height,
              BlocBuilder<CountDownCubit, CountDownState>(
                builder: (context, state) {
                  if (state is CountDownDecrease) {
                    return Visibility(
                      visible: state.remainSeconds > 0 ? true : false,
                      child: Text(
                        state.remainSeconds.formatTimer(),
                        style: AppTextStyle.productTimer,
                      ),
                    );
                  } else if (state is CountDownEnded) {
                    return const SizedBox.shrink();
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          )),
    );
  }
}
