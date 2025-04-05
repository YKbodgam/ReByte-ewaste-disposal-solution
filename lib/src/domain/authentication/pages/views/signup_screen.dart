import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/widget/custom_logo.dart';
import '../../../../utils/palette.dart';
import '../../controllers/signup_controller.dart';

import '../widgets/signup_tab_one.dart';
import '../widgets/signup_tab_two.dart';
import '../widgets/signup_tab_five.dart';
import '../widgets/signup_tab_four.dart';
import '../widgets/signup_tab_three.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final SignupController signupController = Get.put(SignupController());

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
                  count: 5,
                  effect: WormEffect(
                    activeDotColor: Palette.kBorderPrimaryColor,
                    dotColor: Palette.kPrimaryLightColor,
                    dotHeight: 6,
                    dotWidth: size.width * 0.15,
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
              children: [
                SignupTabOne(size: size),
                SignupTabTwo(size: size),
                SignupTabThree(size: size),
                SignupTabFour(size: size),
                SignupTabFive(size: size),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
