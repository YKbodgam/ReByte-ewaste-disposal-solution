import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rebyte/src/utils/text_styles.dart';

import '../../../../common/custom_text.dart';
import '../../../../common/regular_button.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';

import 'choose_container.dart';
import '../../controllers/signup_controller.dart';

class SignupTabOne extends StatelessWidget {
  final Size size;

  const SignupTabOne({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.find<SignupController>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/authentication/img_signup_5.svg',
                height: size.height * 0.3,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.01,
              ),
              child: BuildText(
                text: "signUpTitle5".tr,
                maxLines: 3,
                fontSize: FontSizes.largeTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleBold,
                color: Palette.kTextPrimaryColor,
                alignment: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: BuildText(
                maxLines: 3,
                text: "signUpSubtitle5".tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: LoraTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.02,
                    ),
                    child: GestureDetector(
                      onTap: () => signupController.choiceSelected(context, 0),
                      child: Obx(() {
                        return ChooseContainer(
                          isSelected: signupController.selectedIndex.value == 0,
                          index: 0,
                        );
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.02,
                    ),
                    child: GestureDetector(
                      onTap: () => signupController.choiceSelected(context, 1),
                      child: Obx(() {
                        return ChooseContainer(
                          isSelected: signupController.selectedIndex.value == 1,
                          index: 1,
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: RoundedButton(
                text: "select".tr,
                onPressed:
                    () => signupController.nextPage(
                      signupController.currentPageIndex.value + 1,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
