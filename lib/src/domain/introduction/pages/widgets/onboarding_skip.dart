import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';
import '../../../../common/regular_button.dart';

import '../../controllers/onboard_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();

    return Positioned(
      top: size.height * 0.06,
      right: size.width * 0.04,
      child: RoundedButton(
        text: 'skip'.tr,
        height: 50,
        borderRadius: 15,
        isborder: true,
        suffixIcon: Iconsax.note,
        backgroundColor: Colors.white,
        iconColor: Palette.kBorderPrimaryColor,
        bordercolor: Palette.kBorderPrimaryColor,
        onPressed: () => controller.skipPage(context),
      ),
    );
  }
}
