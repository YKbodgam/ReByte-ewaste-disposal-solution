import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../pages/views/onboarding_final.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPageIndex = 0.obs;

  // Static method to access the controller using Provider
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;

    pageController.animateToPage(
      currentPageIndex.value,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void nextPage(BuildContext context) {
    if (currentPageIndex.value == 3) {
      Get.offAll(
        () => const OnBoardFinal(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 100),
      );
    }
    //
    else {
      currentPageIndex.value += 1;

      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipPage(BuildContext context) {
    Get.offAll(
      () => const OnBoardFinal(),
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
