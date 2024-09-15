import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/data/repository/product_details_repository.dart';
import 'package:watch_store/screens/product_details_screen/bloc/product_details_bloc.dart';
import 'package:watch_store/screens/product_details_screen/widget/features_comments_reviews.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/screens/product_details_screen/widget/add_to_basket_nav.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/widgets/custom_appbar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int id = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) {
        ProductDetailsBloc productDetailsBloc = ProductDetailsBloc(
            interFaceProductDetailsRepository: productDetailsRepository);
        productDetailsBloc.add(ProductDetailsInitial(id: id));
        return productDetailsBloc;
      },
      child: SafeArea(
          child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          if (state is ProductDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text('خطای سرور'),
              backgroundColor: AppColor.errorSnackBarBackGround,
            ));
          }
        },
        builder: (context, state) {
          if (state is ProductDetailsLoding) {
            return const Scaffold(
              body: AppProgressIndicator(),
            );
          } else if (state is ProductDetailsLodded) {
            return Scaffold(
              backgroundColor: AppColor.secondaryBackGround,
              appBar: CustomAppBar(
                size: size,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppDimens.medium),
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
                          const CartBadge(),
                        ],
                      ),
                      // title
                      Expanded(
                          child: Text(
                        state.productDetailsModel.title!,
                        style: AppTextStyle.titleSmallBol,
                        textDirection: TextDirection.rtl,
                      )),
                      AppDimens.small.width,
                      // close icon
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(Assets.svg.close))
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
                          AppDimens.small.height,
                          // image product
                          Image.network(
                            state.productDetailsModel.image!,
                            fit: BoxFit.cover,
                            height: size.height / 3.5,
                          ),
                          (size.height / 18).height,
                          Container(
                            width: size.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppDimens.small),
                            decoration: BoxDecoration(
                                color: AppColor.primaryBackGround,
                                borderRadius:
                                    BorderRadius.circular(AppDimens.medium)),
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
                                    state.productDetailsModel.brand!,
                                    style: AppTextStyle.titleSmallBol,
                                  ),
                                  AppDimens.verySmall.height,
                                  // short description
                                  Text(state.productDetailsModel.title!,
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
                                  FeaturesCommentsReviews(
                                    productDetailsModel:
                                        state.productDetailsModel,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          (AppDimens.veryLarge * 1.5).height
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AddToBasketNavigation(
                        productId: state.productDetailsModel.id!,
                        price: state.productDetailsModel.price!,
                        discountPrice: state.productDetailsModel.discountPrice!,
                        offPercent: state.productDetailsModel.discount!,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            throw Exception('invalid state');
          }
        },
      )),
    );
  }
}
