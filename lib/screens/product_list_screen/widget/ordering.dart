import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/screens/product_list_screen/bloc/product_list_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';

Map sorting = {
  AppString.newest: SortBy.newestProducts,
  AppString.mostExpensive: SortBy.mostExpensiveProducts,
  AppString.cheapest: SortBy.cheapestProducts,
  AppString.mostViewed: SortBy.mostViewedProducts
};

List<String> filterItems = <String>[
  AppString.newest,
  AppString.mostExpensive,
  AppString.mostViewed,
  AppString.cheapest
];

class Ordering extends StatefulWidget {
  const Ordering({super.key, this.sortBy});

  final String? sortBy;

  @override
  State<Ordering> createState() => _OrderingState();
}

class _OrderingState extends State<Ordering> {
  String? itemSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          onChanged: (value) {
            setState(() {
              if (widget.sortBy == null) {
                itemSelected = value;
              } else {
                itemSelected = widget.sortBy;
              }
              BlocProvider.of<ProductListBloc>(context)
                  .add(ProductListSortByEvent(sortBy: sorting[itemSelected]));
            });
          },
          value: itemSelected,
          items: filterItems
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Center(
                    child: Text(
                      item,
                      style: AppTextStyle.titleSmallBol,
                    ),
                  )))
              .toList(),
          isExpanded: true,
          barrierColor: AppColor.primary.withOpacity(0.2),
          customButton: Row(
            children: [
              Text(
                AppString.ordering,
                style: AppTextStyle.titleSmallBol,
              ),
              AppDimens.small.width,
              SvgPicture.asset(Assets.svg.filter),
            ],
          ),
        ),
      ),
    );
  }
}
