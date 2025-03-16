import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/custom_text.dart';
import '../../../../common/regular_button.dart';
import '../../../../common/custom_text_field.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../controllers/signup_controller.dart';

class SignupTabTwo extends StatelessWidget {
  final Size size;

  const SignupTabTwo({super.key, required this.size});

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
                'assets/images/authentication/img_signup_3.svg',
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
                text: 'signUpTitle4'.tr,
                maxLines: 3,
                fontSize: FontSizes.largeTextSize(context),
                textStyle: LoraTextStyle.appTextStyleBold,
                color: Palette.kTextPrimaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: BuildText(
                text: 'signUpSubtitle4'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Form(
              key: signupController.passwordFormKey,
              child: Column(
                children: [
                  Obx(
                    () => CustomTextField(
                      borderRadius: 10,
                      keyboardType: TextInputType.visiblePassword,
                      controller: signupController.passwordController,
                      prefixIcon: Icon(Iconsax.password_check),
                      obscureText:
                          signupController.isPasswordVisible.value
                              ? false
                              : true,
                      focusedBorderColor: Palette.kBorderPrimaryColor,
                      hintText: 'forgotPasswordLabel1'.tr,
                      labelText: 'loginInputLabel2'.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          signupController.isPasswordVisible.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash,
                          color: Palette.kPrimaryDarkAccent,
                        ),
                        onPressed: () {
                          signupController.togglePasswordVisibility();
                        },
                      ),
                      validator:
                          (value) =>
                              signupController.validatePassword(context, value),
                    ),
                  ),
                  CustomTextField(
                    borderRadius: 10,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: signupController.confirmController,
                    prefixIcon: Icon(Iconsax.password_check),
                    focusedBorderColor: Palette.kBorderPrimaryColor,
                    hintText: 'forgotPasswordLabel2'.tr,
                    labelText: 'loginInputLabel2'.tr,
                    validator:
                        (value) => signupController.validateConfirmPassword(
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
                  if (signupController.passwordFormKey.currentState!
                      .validate()) {
                    signupController.nextPage(
                      signupController.currentPageIndex.value + 1,
                    );
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
