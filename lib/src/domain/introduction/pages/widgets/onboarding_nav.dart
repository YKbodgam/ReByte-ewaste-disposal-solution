import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/palette.dart';
import '../../controllers/onboard_controller.dart';

class OnBoardingNav extends StatelessWidget {
  const OnBoardingNav({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();

    return Positioned(
      bottom: size.height * 0.06,
      left: size.width * 0.1,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 4,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: Palette.kPrimaryDarkColor,
          dotHeight: 6,
        ),
      ),
    );
  }
}
