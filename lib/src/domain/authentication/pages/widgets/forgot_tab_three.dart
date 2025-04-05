import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/regular_button.dart';
import '../../../../common/widgets/custom_text_field.dart';
import '../../../../common/widgets/custom_text.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../controllers/forgot_controller.dart';

class ForgotTabThree extends StatelessWidget {
  const ForgotTabThree({super.key});

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
                'assets/images/authentication/img_forgot_3.svg',
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
                text: 'forgotPasswordTitle3'.tr,
                maxLines: 3,
                fontSize: FontSizes.largeTextSize(context),
                textStyle: LoraTextStyle.appTextStyleBold,
                color: Palette.kTextPrimaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: BuildText(
                text: 'forgotPasswordSubtitle3'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Form(
              key: forgotController.passwordFormKey,
              child: Column(
                children: [
                  Obx(
                    () => CustomTextField(
                      borderRadius: 10,
                      keyboardType: TextInputType.visiblePassword,
                      controller: forgotController.passwordController,
                      prefixIcon: Icon(Iconsax.password_check),
                      obscureText:
                          forgotController.isPasswordVisible.value
                              ? false
                              : true,
                      focusedBorderColor: Palette.kBorderPrimaryColor,
                      hintText: 'forgotPasswordLabel1'.tr,
                      labelText: 'loginInputLabel2'.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          forgotController.isPasswordVisible.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                          color: Palette.kPrimaryDarkAccent,
                        ),
                        onPressed: () {
                          forgotController.togglePasswordVisibility();
                        },
                      ),
                      validator:
                          (value) =>
                              forgotController.validatePassword(context, value),
                    ),
                  ),
                  CustomTextField(
                    borderRadius: 10,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: forgotController.confirmController,
                    prefixIcon: Icon(Iconsax.password_check),
                    focusedBorderColor: Palette.kBorderPrimaryColor,
                    hintText: 'forgotPasswordLabel2'.tr,
                    labelText: 'loginInputLabel2'.tr,
                    validator:
                        (value) => forgotController.validateConfirmPassword(
                          context,
                          value,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: RoundedButton(
                text: 'continueButton'.tr,
                suffixIcon: Iconsax.arrow_right_2,
                onPressed: () {
                  if (forgotController.passwordFormKey.currentState!
                      .validate()) {
                    forgotController.resetPassword();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
