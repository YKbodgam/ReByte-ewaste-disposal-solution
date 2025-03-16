import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../common/custom_logo.dart';
import '../../controllers/onboard_controller.dart';

import '../widgets/onboarding_back.dart';
import '../widgets/onboarding_nav.dart';
import '../widgets/onboarding_next.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingController());
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.updatePageIndicator,
            children: [
              OnBoardingBack(
                size: size,
                image: 'assets/images/introduction/img_onboarding_1.svg',
                title: 'onBoardingTitle1'.tr,
                description: 'onBoardingSubtitle1'.tr,
              ),
              OnBoardingBack(
                size: size,
                image: 'assets/images/introduction/img_onboarding_2.svg',
                title: 'onBoardingTitle2'.tr,
                description: 'onBoardingSubtitle2'.tr,
              ),
              OnBoardingBack(
                size: size,
                image: 'assets/images/introduction/img_onboarding_3.svg',
                title: 'onBoardingTitle3'.tr,
                description: 'onBoardingSubtitle3'.tr,
              ),
              OnBoardingBack(
                size: size,
                image: 'assets/images/introduction/img_onboarding_4.svg',
                title: 'onBoardingTitle4'.tr,
                description: 'onBoardingSubtitle4'.tr,
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.06,
            left: size.width * 0.02,
            child: CustomLogo(height: 60),
          ),
          OnBoardingSkip(size: size),
          OnBoardingNav(size: size),
          OnBoardingNextBtn(size: size),
        ],
      ),
    );
  }
}
