import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/data/repository/product_repository.dart';
import 'package:watch_store/screens/product_list_screen/bloc/product_list_state.dart';
import 'package:watch_store/screens/product_list_screen/bloc/brands_state.dart';
import 'package:watch_store/screens/product_list_screen/widget/ordering.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/screens/product_list_screen/bloc/product_list_bloc.dart';
import 'package:watch_store/widgets/app_progress_indicator.dart';
import 'package:watch_store/widgets/cart_badge.dart';
import 'package:watch_store/screens/product_list_screen/widget/tag_list.dart';
import 'package:watch_store/widgets/custom_appbar.dart';
import 'package:watch_store/widgets/product_gridview.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, this.id, this.sortBy});

  final String? sortBy;
  final int? id;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        var productListBloc = ProductListBloc(productListRepository);
        if (id != null) {
          productListBloc.add(ProductListInitialEvent(id: id));
        } else if (sortBy != null) {
          productListBloc.add(ProductListSortByEvent(sortBy: sortBy!));
        }
        productListBloc.add(ProductGetListBrandEvent());
        return productListBloc;
      },
      child: SafeArea(
          child: Scaffold(
        appBar: CustomAppBar(
          size: size,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Ordering(
                  sortBy: sortBy,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(Assets.svg.close))
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDimens.medium.height,
              BlocBuilder<ProductListBloc, ProductListState>(
                builder: (context, state) {
                  if (state.brandsState is ProductListBrandLoaddedState) {
                    var nowState =
                        state.brandsState as ProductListBrandLoaddedState;
                    return TagList(brandsModel: nowState.brandsModel);
                  } else if (state.brandsState is ProductBrandListErrorState) {
                    return const Text('Error state');
                  } else {
                    return const AppProgressIndicator();
                  }
                },
              ),
              (size.height / 18).height,
              BlocConsumer<ProductListBloc, ProductListState>(
                listener: (context, state) {
                  if (state is ProductListErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text('خطای سرور'),
                      backgroundColor: AppColor.errorSnackBarBackGround,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state.productsState is ProductListLoadingState) {
                    return const AppProgressIndicator();
                  } else if (state.productsState is ProductListLoaddedState) {
                    var nowState =
                        state.productsState as ProductListLoaddedState;

                    return ProductGridViewList(
                        productList: nowState.productList);
                  } else {
                    throw Exception('invalid error');
                  }
                },
              ),
              AppDimens.large.height
            ],
          ),
        ),
      )),
    );
  }
}
