import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/component/extension.dart';
import 'package:watch_store/resource/app_color.dart';
import 'package:watch_store/resource/app_dimens.dart';

List<String> imageList = [
  'assets/png/watch.jpg',
  'assets/png/watch1.png',
  'assets/png/watch2.jpg',
  'assets/png/watch3.jpg',
];

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselController _carouselController = CarouselController();
  int _activeIndexIndicator = 0;

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
              items: imageList
                  .map((i) => ClipRRect(
                        borderRadius: BorderRadius.circular(AppDimens.small),
                        child: SizedBox(
                          width: size.width / 1.2,
                          child: Image.asset(
                            i,
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
                onPageChanged: (index, reason) {
                  setState(() {
                    _activeIndexIndicator = index;
                  });
                },
              )),
        ),
        AppDimens.small.height,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList
                .asMap()
                .entries
                .map((e) => Padding(
                      padding: const EdgeInsets.only(left: AppDimens.small),
                      child: GestureDetector(
                        onTap: () { 
                          _carouselController.animateToPage(e.key,
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastEaseInToSlowEaseOut);
                        },
                        child: Container(
                          height: AppDimens.small,
                          width: AppDimens.small,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColor.borderIndicator),
                            color: _activeIndexIndicator == e.key
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
