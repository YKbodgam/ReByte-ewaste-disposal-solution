import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/regular_button.dart';
import '../../../../common/custom_text_field.dart';
import '../../../../common/custom_text.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../controllers/forgot_controller.dart';

class ForgotTabOne extends StatelessWidget {
  const ForgotTabOne({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final ForgotController forgotController = Get.find<ForgotController>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/authentication/img_forgot_1.svg',
                width: size.width * 0.9,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.01,
              ),
              child: BuildText(
                text: 'forgotPasswordTitle1'.tr,
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
                text: 'forgotPasswordSubtitle1'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Form(
              key: forgotController.emailFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    borderRadius: 10,
                    keyboardType: TextInputType.emailAddress,
                    controller: forgotController.userEmailController,
                    prefixIcon: Icon(Iconsax.direct),
                    focusedBorderColor: Palette.kBorderPrimaryColor,
                    hintText: "loginInput1".tr,
                    labelText: "loginInputLabel1".tr,
                    validator: (value) => forgotController.validateEmail(value),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                      ),
                      child: RoundedButton(
                        text: 'verify'.tr,
                        loading: forgotController.loading.value,
                        onPressed: () {
                          if (forgotController.emailFormKey.currentState!
                              .validate()) {
                            forgotController.sendOtp();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
