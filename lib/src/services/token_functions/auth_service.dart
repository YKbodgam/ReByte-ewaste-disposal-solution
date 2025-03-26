import 'dart:convert';

import 'hive_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/snackbar.dart';
import '../../domain/introduction/pages/views/onboarding_final.dart';

import '../token_constant/api_constant.dart';

class AuthService {
  static final HiveService _hiveService = HiveService();
  static var client = http.Client();

  Future<bool> loginUser(String email, String password) async {
    // Hard coded for 15 days
    const int expiresIn = 1296000;
    final expiryDate = DateTime.now().add(Duration(seconds: expiresIn));

    final url = Uri.parse('${ApiConstants.tokenBaseUrl}/api/auth/login');

    try {
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'];

        await _hiveService.saveToken(token, expiryDate);
        await _hiveService.saveEmail(email, expiryDate);

        return true;
      }
      //
      else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);

        SnackWidget.showSnackbar(
          Get.context!,
          responseData['message'] ?? "Invalid email or password.",
          label: 'Retry',
          onPressed: () => loginUser(email, password),
        );

        return false;
      }
      //
      else if (response.statusCode == 403) {
        final responseData = json.decode(response.body);

        SnackWidget.showSnackbar(
          Get.context!,
          responseData['message'],
          label: 'Retry',
          onPressed: () => loginUser(email, password),
        );

        return false;
      }
      //
      else {
        SnackWidget.showSnackbar(
          Get.context!,
          "An unexpected error occurred. Please try again.",
          label: 'Retry',
          onPressed: () => loginUser(email, password),
        );

        return false;
      }
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        "Error While Login $e",
        label: 'Retry',
        onPressed: () => loginUser(email, password),
      );

      return false;
    }
  }

  static Future<bool> signupUser(dynamic model) async {
    //

    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.tokenBaseUrl}/api/auth//signup'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(model.toJson()),
      );

      if (response.statusCode == 201) {
        return true;
      }
      //
      else if (response.statusCode == 400) {
        SnackWidget.showSnackbar(
          Get.context!,
          'Email Already Exists ! Please Use Different Email',
          label: 'Retry',
          onPressed: () => signupUser(model),
        );

        return false;
      }
      //
      else if (response.statusCode > 400 && response.statusCode <= 409) {
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['message'] ?? 'An error occurred.';

        SnackWidget.showSnackbar(
          Get.context!,
          'error: $errorMessage',
          label: 'Retry',
          onPressed: () => signupUser(model),
        );

        return false;
      }
      //
      else {
        SnackWidget.showSnackbar(
          Get.context!,
          "An unexpected error occurred. Please try again.",
          label: 'Retry',
          onPressed: () => signupUser(model),
        );

        return false;
      }
    }
    //
    catch (e) {
      rethrow;
    }
  }

  // OTP_PURPOSE = 'account_creation' | '2' | 'verification' | 'account deletion';
  static Future<bool> verifyOtp(String email, String otp) async {
    ///

    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.tokenBaseUrl}/api/auth/verify-otp'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      if (response.statusCode == 200) {
        return true;
      }
      //
      else {
        final errorResponse = jsonDecode(response.body);

        SnackWidget.showSnackbar(
          Get.context!,
          errorResponse['message'] ?? 'Failed to verify OTP',
          label: 'Retry',
          onPressed: () => verifyOtp(email, otp),
        );

        return false;
      }
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        'Error occurred while sending OTP: $e',
        label: 'Retry',
        onPressed: () => verifyOtp(email, otp),
      );

      return false;
    }
  }

  static Future<bool> sendOtpForgot(String email) async {
    ///

    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.tokenBaseUrl}/api/auth/forgot-password'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        SnackWidget.showSnackbar(Get.context!, 'OTP sent successfully');

        return true;
      }
      //
      else {
        final errorResponse = jsonDecode(response.body);

        SnackWidget.showSnackbar(
          Get.context!,
          errorResponse['message'] ?? 'Failed to send OTP',
          label: 'Retry',
          onPressed: () => sendOtpForgot(email),
        );

        return false;
      }
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        'Error occurred while sending OTP: $e',
        label: 'Retry',
        onPressed: () => sendOtpForgot(email),
      );

      return false;
    }
  }

  static Future<void> resendOtp(String email) async {
    ///

    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.tokenBaseUrl}/api/auth/resend-otp'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        SnackWidget.showSnackbar(
          Get.context!,
          'OTP has been resent. Please check your email',
        );
      }
      //
      else {
        final errorResponse = jsonDecode(response.body);

        SnackWidget.showSnackbar(
          Get.context!,
          errorResponse['message'] ?? 'Failed to send OTP',
          label: 'Retry',
          onPressed: () => sendOtpForgot(email),
        );
      }
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        'Error occurred while sending OTP: $e',
        label: 'Retry',
        onPressed: () => sendOtpForgot(email),
      );
    }
  }

  static Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    //

    final url = Uri.parse(
      '${ApiConstants.tokenBaseUrl}/api/auth/reset-password',
    );

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'otp': otp,
          'newPassword': newPassword,
        }),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        SnackWidget.showSnackbar(Get.context!, 'Password Reset Successfully');

        return responseData;
      }
      //
      else {
        SnackWidget.showSnackbar(
          Get.context!,
          responseData['message'] ?? 'Failed to send OTP',
          label: 'Retry',
          onPressed:
              () => resetPassword(
                email: email,
                otp: otp,
                newPassword: newPassword,
              ),
        );

        return responseData;
      }
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        'Error: Failed to Reset Password',
        label: 'Retry',
        onPressed:
            () =>
                resetPassword(email: email, otp: otp, newPassword: newPassword),
      );

      return {};
    }
  }

  static bool isLoggedIn() {
    final token = _hiveService.getToken();
    final expiryDate = _hiveService.getExpiryDate();

    if (token != null && expiryDate != null) {
      return DateTime.now().isBefore(expiryDate);
    }

    return false;
  }

  void dispose() {
    client.close();
  }

  static Future<void> logout() async {
    try {
      await _hiveService.clearToken();

      Get.offAll(() => OnBoardFinal());
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(
        Get.context!,
        'Error occurred while Logging Out: $e',
        label: 'Retry',
        onPressed: () => logout(),
      );
    }
  }
}
