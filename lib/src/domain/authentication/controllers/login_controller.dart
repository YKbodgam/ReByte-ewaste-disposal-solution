import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../config/snackbar.dart';
import '../../../services/token_functions/auth_service.dart';

import '../../administration/pages/views/home_screen.dart';
import '../../introduction/controllers/user_controller.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isPasswordVisible = false.obs;
  var isRememberMeChecked = false.obs;

  final AuthService auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserController userController = Get.find<UserController>();

  void submitLogin() async {
    isLoading.value = true;

    if (formKey.currentState!.validate()) {
      try {
        // Use LoginService to attempt login
        final isSucess = await auth.loginUser(
          emailController.text.toString().trim(),
          passwordController.text.toString().trim(),
        );

        if (isSucess) {
          await userController.fetchUserData();

          // Navigate to the home screen
          SnackWidget.showSnackbar(Get.context!, 'Login Successful !');

          Get.offAll(() => HomeScreen());
        }
      }
      //
      catch (error) {
        SnackWidget.showSnackbar(
          Get.context!,
          'Error While Login : $error !',
          label: 'Retry',
          onPressed: () => submitLogin(),
        );
      }
      //
      finally {
        isLoading.value = false;
      }
    }
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
