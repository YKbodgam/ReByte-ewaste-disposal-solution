import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../services/token_functions/auth_service.dart';
import '../../introduction/pages/views/onboarding_final.dart';
import '../models/user_model.dart';

import '../../../config/snackbar.dart';

class SignupController extends GetxController {
  // Reactive variables to hold the form values

  var loading = false.obs;
  var isPasswordVisible = false.obs;

  var selectedIndex = 0.obs;
  var currentPageIndex = 0.obs;

  var address = ''.obs;
  var choice = 'Individual'.obs;

  final pageController = PageController();
  final emailFormKey = GlobalKey<FormState>();
  final detailsFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  final userEmailController = TextEditingController();
  final fullNameController = TextEditingController();
  final organizationNameController = TextEditingController();
  final organizationAddressController = TextEditingController();

  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  void choiceSelected(context, index) {
    selectedIndex.value = index;
    choice.value = (index == 0 ? "Individual" : "Organization");
  }

  Future<void> createAccount() async {
    loading.value = true;

    final email = userEmailController.text.trim().toLowerCase();

    try {
      // Call the sendOtp service
      final success = await AuthService.verifyOtp(email, otpController.text);

      if (success) {
        SnackWidget.showSnackbar(
          Get.context!,
          "Account Created successfully ! Please log in",
        );

        Get.offAll(() => OnBoardFinal());
      }
    }
    //
    catch (e) {
      // Directly show the error message from the service

      SnackWidget.showSnackbar(
        Get.context!,
        "Error while Creating Account: ${e.toString()}",
        label: 'Retry',
        onPressed: () => createAccount(),
      );
    }
    // Stop loading
    finally {
      loading.value = false;
    }
  }

  // Function to handle the form submission
  Future<void> submitForm() async {
    loading.value = true;
    var response = false;

    try {
      if (selectedIndex.value == 0) {
        UserModel user = UserModel(
          userFullName: fullNameController.text.trim(), // Full name
          userEmailID: userEmailController.text.trim(), // Email
          userPassword: passwordController.text.trim(), // Password
          role: 'user', // User role
        );

        response = await AuthService.signupUser(user);
      }
      //
      else {
        UserModel organization = UserModel(
          role: "organization",
          organizationName:
              organizationNameController.text.trim(), // Organization name
          organizationAddress:
              organizationAddressController.text.trim(), // Organization address
          userFullName: fullNameController.text.trim(), // Full name
          userEmailID: userEmailController.text.trim(), // Email
          userPassword: passwordController.text.trim(), // Password
        );

        response = await AuthService.signupUser(organization);
      }

      if (response) {
        SnackWidget.showSnackbar(Get.context!, 'Otp send successfully');

        nextPage(currentPageIndex.value + 1);
      }
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        'Error:  ${e.toString()}',
        label: 'Retry',
        onPressed: () => submitForm(),
      );
    }
    //
    finally {
      loading.value = false;
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

  void nextPage(var index) {
    currentPageIndex.value = index;

    pageController.animateToPage(
      currentPageIndex.value,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full Name Cannot Be Empty';
    }

    if (value.length < 3) {
      return 'Full Name Must Be At Least 3 Characters Long';
    }

    if (!RegExp(r'^[A-Za-z0-9\s&.-]+$').hasMatch(value)) {
      return 'Full Name Contains Invalid Characters';
    }

    return null;
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
    fullNameController.dispose();
    userEmailController.dispose();

    passwordController.dispose();
    confirmController.dispose();

    pageController.dispose();
    super.dispose();
  }
}
