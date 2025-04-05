import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/custom_logo.dart';
import '../../../../common/widget/custom_text.dart';
import '../../../../common/widget/regular_button.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../../authentication/pages/views/login_screen.dart';
import '../../../authentication/pages/views/signup_screen.dart';

class OnBoardFinal extends StatelessWidget {
  const OnBoardFinal({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/introduction/img_onboarding_5.svg',
                  width: size.width,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.02,
              ),
              child: CustomLogo(height: 70),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: BuildText(
                maxLines: 5,
                alignment: TextAlign.left,
                text: 'headlineTitle'.tr,
                color: Palette.kTextPrimaryColor,
                fontSize: FontSizes.largeTextSize(context),
                textStyle: LoraTextStyle.appTextStyleBold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.02,
                horizontal: size.width * 0.05,
              ),
              child: BuildText(
                maxLines: 10,
                alignment: TextAlign.justify,
                text: 'headlineSubtitle'.tr,
                color: Palette.kTextSecondaryColor,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: LoraTextStyle.appTextStyleMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.04,
              ),
              child: RoundedButton(
                text: 'login'.tr,
                height: size.height * 0.065,
                onPressed: () => Get.to(() => LoginScreen()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.04,
              ),
              child: RoundedButton(
                text: 'signUp'.tr,
                isborder: true,
                height: size.height * 0.065,
                onPressed: () => Get.to(() => SignupScreen()),
                backgroundColor: Colors.white,
                textColor: Palette.kBorderPrimaryColor,
                bordercolor: Palette.kBorderPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
