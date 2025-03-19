import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/regular_button.dart';
import '../../../../common/custom_text.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../controllers/signup_controller.dart';

class SignupTabFive extends StatelessWidget {
  final Size size;

  const SignupTabFive({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
          horizontal: size.width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                'assets/images/authentication/img_signup_4.svg',
                height: size.height * 0.35,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.01,
              ),
              child: BuildText(
                text: 'signUpTitle2'.tr,
                maxLines: 3,
                fontSize: FontSizes.largeTextSize(context),
                textStyle: LoraTextStyle.appTextStyleBold,
                color: Palette.kTextPrimaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: BuildText(
                maxLines: 10,
                text: 'signUpSubtitle2'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.01,
                vertical: size.height * 0.02,
              ),
              child: Pinput(
                length: 4,
                controller: signupController.otpController,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 55,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Palette.kPrimaryLightColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Palette.kBorderPrimaryColor,
                      width: 1.0,
                    ),
                  ),
                  textStyle: LoraTextStyle.appTextStyleBold,
                ),
                onCompleted: (value) => signupController.createAccount(),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: RoundedButton(
                  text: 'continueButton'.tr,
                  loading: signupController.loading.value,
                  onPressed: () => signupController.createAccount(),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BuildText(
                  text: 'forgotPasswordLabel3'.tr,
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: SpaceTextStyle.appTextStyleMedium,
                  color: Palette.kTextSecondaryColor,
                ),
                SizedBox(width: size.width * 0.02),
                GestureDetector(
                  onTap: () => signupController.resendOtp(),
                  child: BuildText(
                    text: "resend".tr,
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleBold,
                    color: Palette.kSecondaryButtonColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
