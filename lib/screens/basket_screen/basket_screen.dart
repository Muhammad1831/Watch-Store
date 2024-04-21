import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/screens/basket_screen/widget/shopping_product_item.dart';
import 'package:watch_store/widgets/app_elevatedbutton.dart';
import 'package:watch_store/widgets/surface_container.dart';
import 'package:watch_store/widgets/custom_appbar.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          size: size,
          child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: AppDimens.large),
                child: Text(
                  AppString.bascket,
                  style: AppTextStyle.titleSmallBol,
                ),
              ))),
      body: Column(
        children: [
          AppDimens.small.height,
          // send to address container
          Container(
            height: size.height / 10,
            width: size.width,
            padding: const EdgeInsets.only(
                right: AppDimens.medium, left: AppDimens.verySmall / 2),
            decoration: const BoxDecoration(
                color: AppColor.primaryBackGround,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: AppColor.appBarShadow)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        Assets.svg.forwardFlash,
                      )),
                ),
                SizedBox(
                  width: size.width / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppString.sendToAddress,
                        style: AppTextStyle.titleSmallBol.copyWith(
                            color: const Color.fromARGB(255, 136, 141, 155)),
                      ),
                      AppDimens.small.height,
                      Text(
                        ' از صنعت چاپلورم ایپسوم متن ساختگیبا تولید سادگی نامفهوم از صنعت چاپاز صنعت چاپلورم ایپسوم متن ساختگیبا تولید سادگی نامفهوم از صنعت چاپ چاپاز صنعت چاپلورم ایپسوم متن ساختگیبا تولید سادگی نامفهوم از صنعت چاپ ',
                        style: AppTextStyle.titleSmallBol,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          AppDimens.large.height,
          // list of produtes in basket
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const SurfaceContainer(
                    child: ShoppingProductItem(),
                  );
                }),
          ),
          Container(
            height: size.height / 15,
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.small),
            decoration: const BoxDecoration(color: AppColor.primaryBackGround),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppString.total}  ${'85000'.englishToPersion} تومان',
                  style: AppTextStyle.titleMediumReg,
                ),
                AppElevatedButton(
                  buttonName: AppString.continueBuyProcess,
                  buttonColor: AppColor.buttonBackGroundSecondary,
                  height: size.height / 25,
                  width: size.width / 2.5,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
