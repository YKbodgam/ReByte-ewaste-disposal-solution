import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/regular_button.dart';
import '../../../../common/widgets/custom_text.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../controllers/forgot_controller.dart';

class ForgotTabTwo extends StatelessWidget {
  const ForgotTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final ForgotController forgotController = Get.find<ForgotController>();

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
                'assets/images/authentication/img_forgot_2.svg',
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
                text: 'forgotPasswordTitle2'.tr,
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
                text: 'forgotPasswordSubtitle2'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
              child: Center(
                child: Pinput(
                  length: 4,
                  controller: forgotController.otpController,
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
                  onCompleted:
                      (value) => forgotController.nextPage(
                        forgotController.currentPageIndex.value + 1,
                      ),
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: RoundedButton(
                  text: 'continueButton'.tr,
                  suffixIcon: Iconsax.arrow_right_2,
                  loading: forgotController.loading.value,
                  onPressed:
                      () => forgotController.nextPage(
                        forgotController.currentPageIndex.value + 1,
                      ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BuildText(
                  text: 'forgotPasswordLabel3'.tr,
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: SpaceTextStyle.appTextStyleMedium,
                  color: Palette.kTextSecondaryColor,
                ),
                SizedBox(width: size.width * 0.01),
                GestureDetector(
                  onTap: () => forgotController.resendOtp(),
                  child: BuildText(
                    text: "resend".tr,
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleBold,
                    color: Palette.kSecondaryButtonColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
