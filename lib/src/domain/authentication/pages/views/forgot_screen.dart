import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/widgets/custom_logo.dart';
import '../../../../utils/palette.dart';

import '../../controllers/forgot_controller.dart';
import '../widgets/forgot_tab_one.dart';
import '../widgets/forgot_tab_three.dart';
import '../widgets/forgot_tab_two.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final ForgotController signupController = Get.put(ForgotController());

    return Scaffold(
      appBar: AppBar(
        title: CustomLogo(height: 50),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.012),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                  controller: signupController.pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Palette.kBorderPrimaryColor,
                    dotColor: Palette.kPrimaryLightColor,
                    dotHeight: 6,
                    dotWidth: size.width * 0.2,
                    spacing: size.width * 0.03,
                    strokeWidth: 1.5,
                  ),
                  onDotClicked: (value) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: signupController.pageController,
              onPageChanged: (value) => signupController.nextPage,
              physics: NeverScrollableScrollPhysics(),
              children: [ForgotTabOne(), ForgotTabTwo(), ForgotTabThree()],
            ),
          ),
        ],
      ),
    );
  }
}
