import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/custom_logo.dart';
import '../../../../common/custom_text.dart';
import '../../../../common/regular_button.dart';
import '../../../../services/token_functions/auth_service.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

import '../../../introduction/controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final UserController userController = Get.find<UserController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomLogo(height: 90),
            SizedBox(height: size.height * 0.03),
            BuildText(
              text: userController.user.value.userFullName,
              fontSize: FontSizes.regularTextSize(context),
              textStyle: MerriweatherTextStyle.appTextStyleBoldItalic,
            ),
            BuildText(
              text: userController.user.value.userEmailID,
              fontSize: FontSizes.regularTextSize(context),
              textStyle: MerriweatherTextStyle.appTextStyleBoldItalic,
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: RoundedButton(
                text: 'Log Out',
                suffixIcon: Iconsax.logout,
                onPressed: () => AuthService.logout(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
