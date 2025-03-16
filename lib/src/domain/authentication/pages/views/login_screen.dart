import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/custom_logo.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/regular_button.dart';
import '../../../../common/custom_text_field.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../controllers/login_controller.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/authentication/img_login_1.svg',
                height: size.height * 0.3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                  horizontal: size.width * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BuildText(
                          text: 'loginTitle'.tr,
                          fontSize: FontSizes.largeTextSize(context),
                          color: Palette.kTextPrimaryColor,
                          textStyle: LoraTextStyle.appTextStyleBold,
                        ),
                        CustomLogo(),
                      ],
                    ),
                    BuildText(
                      maxLines: 5,
                      alignment: TextAlign.left,
                      text: 'loginSubtitle'.tr,
                      color: Palette.kTextSecondaryColor,
                      fontSize: FontSizes.mediumTextSize(context),
                      textStyle: SpaceTextStyle.appTextStyleMedium,
                    ),
                  ],
                ),
              ),
              Form(
                key: loginController.formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      borderRadius: 10,
                      keyboardType: TextInputType.emailAddress,
                      controller: loginController.emailController,
                      prefixIcon: Icon(Iconsax.direct),
                      focusedBorderColor: Palette.kBorderPrimaryColor,
                      hintText: 'loginInput1'.tr,
                      labelText: 'loginInputLabel1'.tr,
                      validator:
                          (value) => loginController.validateEmail(value),
                    ),
                    Obx(
                      () => CustomTextField(
                        borderRadius: 10,
                        keyboardType: TextInputType.visiblePassword,
                        controller: loginController.passwordController,
                        prefixIcon: Icon(Iconsax.password_check),
                        obscureText:
                            loginController.isPasswordVisible.value
                                ? false
                                : true,
                        focusedBorderColor: Palette.kBorderPrimaryColor,
                        hintText: 'loginInput2'.tr,
                        labelText: 'loginInputLabel2'.tr,
                        suffixIcon: IconButton(
                          icon: Icon(
                            loginController.isPasswordVisible.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash,
                            color: Palette.kPrimaryDarkAccent,
                          ),
                          onPressed: () {
                            loginController.togglePasswordVisibility();
                          },
                        ),
                        validator:
                            (value) => loginController.validatePassword(
                              context,
                              value,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.005,
                        horizontal: size.width * 0.02,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(() => ForgotScreen()),
                            child: BuildText(
                              text: 'loginForgot'.tr,
                              fontSize: FontSizes.labelLargeTextSize(context),
                              textStyle: SpaceTextStyle.appTextStyleRegular,
                              color: Palette.kTextPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                        ),
                        child: RoundedButton(
                          text: 'login'.tr,
                          loading: loginController.isLoading.value,
                          onPressed: () {
                            if (loginController.formKey.currentState!
                                .validate()) {
                              loginController.submitLogin();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
