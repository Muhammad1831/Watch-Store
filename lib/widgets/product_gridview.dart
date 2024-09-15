import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/models/product_model.dart';
import 'package:watch_store/screens/authentication/cubit/count_down_cubit.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/widgets/product_item.dart';

class ProductGridViewList extends StatelessWidget {
  const ProductGridViewList({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDimens.medium, 0, AppDimens.medium, AppDimens.medium),
      child: GridView.builder(
          itemCount: productList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: AppDimens.small,
              mainAxisSpacing: AppDimens.medium,
              crossAxisCount: 2,
              childAspectRatio: 0.62),
          itemBuilder: (context, index) {
            final countDownCubit = CountDownCubit();
            countDownCubit.countDownStart(
                totalSecond:
                    productList[index].specialExpiration.convertTimeToSecond());
            return BlocProvider.value(
              value: countDownCubit,
              child: ProductItem(
                product: productList[index],
              ),
            );
          }),
    );
  }
}
