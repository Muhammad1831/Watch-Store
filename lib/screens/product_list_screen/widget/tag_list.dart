import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/models/brands_model.dart';
import 'package:watch_store/screens/product_list_screen/bloc/product_list_bloc.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/style/extension.dart';

class TagList extends StatefulWidget {
  const TagList({
    super.key,
    required this.brandsModel,
  });

  final List<BrandsModel> brandsModel;

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  int brandSelected = -1;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: AppDimens.large),
      child: SizedBox(
        height: size.height / 24,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemCount: widget.brandsModel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    brandSelected = widget.brandsModel[index].id;
                  });

                  BlocProvider.of<ProductListBloc>(context).add(
                      ProductListByBrandEvent(
                          id: widget.brandsModel[index].id));
                },
                child: Container(
                  width: size.width / 3,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.verySmall),
                  margin: const EdgeInsets.symmetric(
                      horizontal: AppDimens.verySmall),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.veryLarge),
                      color: widget.brandsModel[index].id == brandSelected
                          ? AppColor.tagListBackGroundSelected
                          : AppColor.tagListBackGroundUnselected),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.brandsModel[index].title,
                        style: AppTextStyle.tagName,
                      ),
                      AppDimens.small.width,
                      Image.network(
                        widget.brandsModel[index].image,
                        width: size.height / 16,
                        fit: BoxFit.fitHeight,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
