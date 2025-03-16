import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/snackbar.dart';
import '../../../services/token_functions/auth_service.dart';
import '../../introduction/pages/views/onboarding_final.dart';

class ForgotController extends GetxController {
  var loading = false.obs;
  var currentPageIndex = 0.obs;
  var isPasswordVisible = false.obs;

  final pageController = PageController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  final userEmailController = TextEditingController();
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void nextPage(var index) {
    currentPageIndex.value = index;

    pageController.animateToPage(
      currentPageIndex.value,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  Future<void> sendOtp() async {
    loading.value = true;

    if (emailFormKey.currentState!.validate()) {
      final email = userEmailController.text.trim();

      try {
        // Call the sendOtp service
        final success = await AuthService.sendOtpForgot(email);

        if (success) {
          nextPage(currentPageIndex.value + 1);
        }
      }
      //
      catch (e) {
        // Directly show the error message from the service

        SnackWidget.showSnackbar(
          Get.context!,
          "Error Sending OTP: ${e.toString()}",
          label: 'Retry',
          onPressed: () => sendOtp(),
        );
      }
      // Stop loading
      finally {
        loading.value = false;
      }
    }
  }

  Future<void> resendOtp() async {
    loading.value = true;

    final email = userEmailController.text.trim();

    try {
      // Call the sendOtp service
      await AuthService.resendOtp(email);
    }
    //
    catch (e) {
      // Directly show the error message from the service

      SnackWidget.showSnackbar(
        Get.context!,
        "Error Sending OTP: ${e.toString()}",
        label: 'Retry',
        onPressed: () => resendOtp(),
      );
    }
    // Stop loading
    finally {
      loading.value = false;
    }
  }

  void resetPassword() async {
    loading.value = true;

    final response = await AuthService.resetPassword(
      email: userEmailController.text.trim(),
      otp: otpController.text.trim(),
      newPassword: confirmController.text.trim(),
    );

    if (response != {} &&
        response['message'] == 'Password reset successfully.') {
      Get.offAll(() => OnBoardFinal());
    }
    //
    else if (response != {} &&
        response['message'] == 'Invalid or expired OTP.') {
      nextPage(currentPageIndex.value - 1);
    }
    //
    else if (response != {} && response['message'] == 'User not found.') {
      nextPage(currentPageIndex.value - 2);
    }

    loading.value = false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email Field Cannot Be Empty';
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please Provide Valid Email Address';
    }

    return null;
  }

  String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Field Cannot Be Empty';
    }

    if (!RegExp(r'^.{8,}$').hasMatch(value)) {
      return 'Password Must Be At Least 8 Characters Long';
    }

    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Password Must Contain At Least One Lowercase Letter';
    }

    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password Must Contain At Least One Uppercase Letter';
    }

    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Password Must Contain At Least One Number';
    }

    if (!RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(value)) {
      return 'Password Must Contain At Least One Special Character';
    }

    return null;
  }

  // Confirm Password Validator
  String? validateConfirmPassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password Field Cannot Be Empty';
    }

    if (value != passwordController.text) {
      return "Confirm Password Doesn't match";
    }
    return null;
  }

  @override
  void dispose() {
    otpController.dispose();
    userEmailController.dispose();

    passwordController.dispose();
    confirmController.dispose();

    pageController.dispose();
    super.dispose();
  }
}
