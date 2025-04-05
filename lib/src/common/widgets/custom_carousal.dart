import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/palette.dart';
import '../../domain/administration/controllers/carousel_controller.dart';

class CustomCarousal extends StatelessWidget {
  final bool needIndicator;
  final double carouselHeight;

  final CarouselControllerGetx carouselControllerGetx = Get.put(
    CarouselControllerGetx(),
  );

  final List<Widget> items;

  CustomCarousal({
    this.needIndicator = true,
    super.key,
    required this.items,
    required this.carouselHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: carouselControllerGetx.carouselController,
          options: CarouselOptions(
            height: carouselHeight,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            enlargeCenterPage: true,
            padEnds: true,
            onPageChanged: (index, reason) {
              carouselControllerGetx.updateIndex(index);
            },
            viewportFraction: 0.9,
          ),

          items: items,
        ),
        needIndicator ? SizedBox(height: 15.h) : SizedBox(),
        needIndicator
            ? Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: carouselControllerGetx.currentIndex.value,
                count: items.length,
                effect: ExpandingDotsEffect(
                  expansionFactor: 1.1,

                  radius: 10.r,
                  dotHeight: 5.h,
                  dotWidth: 5.w,
                  activeDotColor: Palette.kPrimaryDarkAccent,
                  dotColor: Palette.kPrimaryBackgroundColor,
                ),
                onDotClicked: (index) {
                  carouselControllerGetx.carouselController.animateToPage(
                    index,
                  );
                },
              ),
            )
            : SizedBox(),
      ],
    );
  }
}
