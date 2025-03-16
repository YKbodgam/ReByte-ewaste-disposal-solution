import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';
import '../../controllers/onboard_controller.dart';

class OnBoardingNextBtn extends StatelessWidget {
  const OnBoardingNextBtn({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnBoardingController>();

    return Positioned(
      right: size.width * 0.06,
      bottom: size.height * 0.04,
      child: ElevatedButton(
        onPressed: () => controller.nextPage(context),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(16.0),
          backgroundColor: Palette.kSecondaryLightColor,
          iconColor: Colors.black,
        ),
        child: Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
