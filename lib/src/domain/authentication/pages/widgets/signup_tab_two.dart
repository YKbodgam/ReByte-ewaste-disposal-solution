import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widget/custom_text.dart';
import '../../../../common/widget/regular_button.dart';
import '../../../../common/widget/custom_text_field.dart';

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
          horizontal: size.width * 0.04,
          vertical: size.height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/authentication/img_signup_1.svg',
                width: size.width * 0.8,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
                horizontal: size.width * 0.01,
              ),
              child: BuildText(
                text: 'signUpTitle3'.tr,
                maxLines: 3,
                fontSize: FontSizes.largeTextSize(context),
                textStyle: LoraTextStyle.appTextStyleBold,
                color: Palette.kTextPrimaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: BuildText(
                maxLines: 5,
                text: 'signUpSubtitle3'.tr,
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleMedium,
                color: Palette.kTextSecondaryColor,
                alignment: TextAlign.justify,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Form(
              key: signupController.detailsFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    borderRadius: 10,
                    keyboardType: TextInputType.name,
                    controller: signupController.fullNameController,
                    prefixIcon: Icon(Iconsax.user_edit),
                    focusedBorderColor: Palette.kBorderPrimaryColor,
                    hintText: 'Please enter your full name',
                    labelText: 'Full Name',
                    validator:
                        (value) => signupController.validateFullName(value),
                  ),
                  Visibility(
                    visible: signupController.selectedIndex.value == 1,
                    child: CustomTextField(
                      borderRadius: 10,
                      keyboardType: TextInputType.name,
                      controller: signupController.organizationNameController,
                      prefixIcon: Icon(Iconsax.user_edit),
                      focusedBorderColor: Palette.kBorderPrimaryColor,
                      hintText: 'Please enter your organization name',
                      labelText: 'Organization Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Organization Name cannot be empty";
                        }

                        return null;
                      },
                    ),
                  ),
                  Visibility(
                    visible: signupController.selectedIndex.value == 1,
                    child: CustomTextField(
                      borderRadius: 10,
                      keyboardType: TextInputType.name,
                      controller:
                          signupController.organizationAddressController,
                      prefixIcon: Icon(Iconsax.user_edit),
                      focusedBorderColor: Palette.kBorderPrimaryColor,
                      hintText: 'Please enter your organization address',
                      labelText: 'Address',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Organization Address cannot be empty";
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: RoundedButton(
                text: 'continueButton'.tr,
                suffixIcon: Iconsax.arrow_right_2,
                onPressed: () {
                  if (signupController.detailsFormKey.currentState!
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
