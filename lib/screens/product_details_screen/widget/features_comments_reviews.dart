import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/constant/app_string.dart';
import 'package:watch_store/models/product_details_model.dart';
import 'package:watch_store/style/app_text_style.dart';
import 'package:watch_store/style/extension.dart';

class FeaturesCommentsReviews extends StatefulWidget {
  const FeaturesCommentsReviews({
    super.key,
    required this.productDetailsModel,
  });

  final ProductDetailsModel productDetailsModel;

  @override
  State<FeaturesCommentsReviews> createState() =>
      _FeaturesCommentsReviewsState();
}

class _FeaturesCommentsReviewsState extends State<FeaturesCommentsReviews> {
  int index = 0;

  void tabSelected(int indexSelected) {
    setState(() {
      index = indexSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                tabSelected(2);
              },
              child:
                  Text(AppString.comments, style: AppTextStyle.titleSmallBol),
            ),
            GestureDetector(
              onTap: () {
                tabSelected(1);
              },
              child: Text(AppString.reviews, style: AppTextStyle.titleSmallBol),
            ),
            GestureDetector(
              onTap: () {
                tabSelected(0);
              },
              child: Text(
                AppString.features,
                style: AppTextStyle.titleSmallBol,
              ),
            ),
          ],
        ),
        (size.height / 18).height,
        IndexedStack(
          index: index,
          children: [
            Features(
              properties: widget.productDetailsModel.properties!,
             ),
            Reviews(
              reviews: widget.productDetailsModel.description!,
            ),
            Comments(
              comments: widget.productDetailsModel.comments!,
            ),
          ],
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class Features extends StatelessWidget {
  Features({
    required this.properties,
    super.key,
  });

  List<PropertiesModel> properties;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: properties.length,
          itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.small),
      child: Container(
        height: size.height / 15,
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(AppDimens.verySmall),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: AppDimens.medium),
            child: Text(
              '${properties[index].property} : ${properties[index].value}',
              style: AppTextStyle.titleSmallReg,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
          },
        );
  }
}

// ignore: must_be_immutable
class Comments extends StatelessWidget {
  Comments({
    required this.comments,
    super.key,
  });

  List<CommentsModel> comments;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.small),
      child: Container(
        height: size.height / 15,
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(AppDimens.verySmall),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: AppDimens.medium),
            child: Text(
              '${comments[index].body} : ${comments[index].user}',
              style: AppTextStyle.titleSmallReg,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      ),
    );
          },
        );
  }
}

// ignore: must_be_immutable
class Reviews extends StatelessWidget {
  Reviews({
    required this.reviews,
    super.key,
  });

  String reviews;

  @override
  Widget build(BuildContext context) {
    return Text(
      reviews,
      style: AppTextStyle.bodySmallMed,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.justify,
    );
  }
}
