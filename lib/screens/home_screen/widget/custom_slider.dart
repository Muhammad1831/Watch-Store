import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_store/style/extension.dart';
import 'package:watch_store/models/sliders_model.dart';
import 'package:watch_store/constant/app_color.dart';
import 'package:watch_store/constant/app_dimens.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  CustomSlider({super.key, required this.imageList});

  List<SlidersModel> imageList;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselController _carouselController = CarouselController();
  int _activeIndexIndicator = 0;

  void itemSliderSelected(int index) {
    setState(() {
      _activeIndexIndicator = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 4.3,
          width: size.width,
          child: CarouselSlider(
              carouselController: _carouselController,
              items: widget.imageList
                  .map((element) => ClipRRect(
                        borderRadius: BorderRadius.circular(AppDimens.small),
                        child: SizedBox(
                          width: size.width / 1.2,
                          child: Image.network(
                            element.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 8),
                autoPlayAnimationDuration: const Duration(seconds: 2),
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                onPageChanged: (index, reason) => itemSliderSelected(index),
              )),
        ),
        AppDimens.small.height,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageList
                .asMap()
                .entries
                .map((element) => Padding(
                      padding: const EdgeInsets.only(left: AppDimens.small),
                      child: GestureDetector(
                        onTap: () {
                          _carouselController.animateToPage(element.key,
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastEaseInToSlowEaseOut);
                        },
                        child: Container(
                          height: AppDimens.small,
                          width: AppDimens.small,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.borderIndicator),
                            color: _activeIndexIndicator == element.key
                                ? AppColor.activeIndicator
                                : AppColor.unActiveIndicator,
                          ),
                        ),
                      ),
                    ))
                .toList())
      ],
    );
  }
}
