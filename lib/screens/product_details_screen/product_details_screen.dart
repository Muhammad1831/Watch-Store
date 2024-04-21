import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/app_text_style.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';
import 'package:watch_store/resource/app_string.dart';
import 'package:watch_store/screens/product_details_screen/widget/add_to_basket_nav.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/widgets/custom_appbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.secondaryBackGround,
      appBar: CustomAppBar(
        size: size,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // basket icon
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: AppDimens.large * 1.4,
                    width: size.width / 8,
                  ),
                  SvgPicture.asset(Assets.svg.bascket),
                  const CartBadge(
                    numberOfProductsInBasket: 3,
                  ),
                ],
              ),
              // title
              Expanded(
                  child: Text(
                'ساعت شیائومی mi Watch lite',
                style: AppTextStyle.titleSmallBol,
                textDirection: TextDirection.rtl,
              )),
              AppDimens.small.width,
              // close icon
              SvgPicture.asset(Assets.svg.close)
            ],
          ),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // image product
                  Image.asset(
                    Assets.png.productWatch2.path,
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                  (size.height / 18).height,
                  Container(
                    width: size.width,
                    margin:
                        const EdgeInsets.symmetric(horizontal: AppDimens.small),
                    decoration: BoxDecoration(
                        color: AppColor.primaryBackGround,
                        borderRadius: BorderRadius.circular(AppDimens.medium)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          AppDimens.large,
                          AppDimens.verySmall,
                          AppDimens.large,
                          AppDimens.large),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // title
                          Text(
                            'اسکمی',
                            style: AppTextStyle.titleSmallBol,
                          ),
                          AppDimens.verySmall.height,
                          // short description
                          Text('مسواک بنسر مدل اکسترا با برس متوسط 3 عددی',
                              style: AppTextStyle.titleSmallBol),
                          AppDimens.medium.height,
                          // divider
                          const Divider(
                            color: AppColor.dividerGreyLight,
                            endIndent: AppDimens.verySmall,
                            indent: AppDimens.verySmall,
                            thickness: 2,
                          ),
                          AppDimens.medium.height,
                          // features & comments & reviews
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(AppString.comments,
                                  style: AppTextStyle.titleSmallBol),
                              Text(AppString.reviews,
                                  style: AppTextStyle.titleSmallBol),
                              Text(AppString.features,
                                  style: AppTextStyle.titleSmallBol),
                            ],
                          ),
                          (size.height / 18).height,
                          // features content
                          Text(
                            'در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفالورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.',
                            style: AppTextStyle.bodySmallMed,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                  ),
                  (AppDimens.veryLarge * 1.5).height
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AddToBasketNavigation(
                price: 122000,
                offPercent: 20,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
