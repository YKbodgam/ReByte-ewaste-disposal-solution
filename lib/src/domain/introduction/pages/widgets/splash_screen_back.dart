import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';
import '../../controllers/splash_controller.dart';

class CenteredTextWithPadding extends StatelessWidget {
  const CenteredTextWithPadding({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final SplashController splashController = Get.put<SplashController>(
      SplashController(),
    );

    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo Slide-in Animation
          SlideTransition(
            position: splashController.offsetAnimation,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Image.asset(
                'assets/images/identification/app_icon_foreground.png',
              ),
            ),
          ),

          SlideTransition(
            position: splashController.offsetAnimation,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
              child: Image.asset(
                'assets/images/identification/app_logo_text.png',
              ),
            ),
          ),

          SizedBox(height: size.height * 0.05),

          // Progress Bar Fade-in + Animation
          AnimatedOpacity(
            opacity: splashController.progressOpacity.value,
            duration: const Duration(milliseconds: 500), // Smooth fade-in
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: splashController.progress.value),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 3,
                    borderRadius: BorderRadius.circular(10.0),
                    backgroundColor: Palette.kPrimaryLightColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Palette.kPrimaryDarkColor,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
