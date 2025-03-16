import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rebyte/src/domain/introduction/pages/views/onboarding_screen.dart';

import '../../../services/token_functions/auth_service.dart';
import '../../../services/token_functions/hive_service.dart';
import '../../administration/pages/views/home_screen.dart';
import '../pages/views/choose_language.dart';
import 'user_controller.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //

  RxBool showProgress = false.obs;
  RxDouble progress = 0.0.obs;
  RxDouble progressOpacity = 0.0.obs;

  late AnimationController animationController;
  late Animation<Offset> offsetAnimation;

  final HiveService _hiveService = HiveService();
  final UserController userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();

    // Logo Animation
    animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3), // Start slightly above bottom
      end: const Offset(0, 0), // Move to center
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward().then((_) {
      // Delay progress bar appearance
      Future.delayed(const Duration(milliseconds: 200), () {
        showProgress.value = true;

        // Smooth fade-in animation for progress bar
        Future.delayed(const Duration(milliseconds: 500), () {
          progressOpacity.value = 1.0;
        });

        checkSignedIn();

        // Start smooth progress animation
        Timer.periodic(const Duration(milliseconds: 50), (timer) {
          if (progress.value < 1.0) {
            progress.value += 0.02;
          } else {
            timer.cancel();
          }
        });
      });
    });
  }

  @override
  void onClose() {
    animationController.dispose();

    super.onClose();
  }

  Future<void> checkSignedIn() async {
    if (AuthService.isLoggedIn()) {
      await userController.fetchUserData();

      Timer(const Duration(seconds: 2), () => Get.off(() => HomeScreen()));
    }
    //
    else if (_hiveService.getLocale() != null) {
      Timer(const Duration(seconds: 2), () => Get.off(() => OnBoardScreen()));
    }
    //
    else {
      Timer(const Duration(seconds: 2), () => Get.off(() => SelectLanguage()));
    }
  }
}
