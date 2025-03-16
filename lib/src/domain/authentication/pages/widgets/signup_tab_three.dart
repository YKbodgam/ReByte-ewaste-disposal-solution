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

import '../../controllers/signup_controller.dart';

class SignupTabThree extends StatelessWidget {
  final Size size;

  const SignupTabThree({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>();

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
                'assets/images/authentication/img_signup_2.svg',
                width: size.width,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.01,
              ),
              child: BuildText(
                text: 'signUpTitle1'.tr,
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
                text: 'signUpSubtitle1'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Form(
              key: signupController.emailFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    borderRadius: 10,
                    keyboardType: TextInputType.emailAddress,
                    controller: signupController.userEmailController,
                    prefixIcon: Icon(Iconsax.direct),
                    focusedBorderColor: Palette.kBorderPrimaryColor,
                    labelText: "loginInputLabel1".tr,
                    hintText: "loginInput1".tr,
                    validator: (value) => signupController.validateEmail(value),
                  ),
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                      ),
                      child: RoundedButton(
                        text: 'verify'.tr,
                        loading: signupController.loading.value,
                        onPressed: () {
                          if (signupController.emailFormKey.currentState!
                              .validate()) {
                            signupController.submitForm();
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
