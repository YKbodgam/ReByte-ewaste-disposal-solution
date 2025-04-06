import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../domain/authentication/pages/views/login_screen.dart';

import '../token_constant/api_constant.dart';
import 'hive_service.dart';

class UserService {
  //

  static Future<dynamic> fetchUserData() async {
    final url = Uri.parse('${ApiConstants.tokenBaseUrl}/api/profile/');
    final hiveService = HiveService();
    final token = hiveService.getToken();

    if (token == null) {
      Get.offAll(() => LoginScreen());
      return Future.error('Token is missing. Redirecting to login.');
    }

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Return raw JSON
      } else {
        final jsonData = json.decode(response.body);
        return Future.error(jsonData['message'] ?? 'Unknown error');
      }
    } catch (error) {
      return Future.error('Failed to fetch user data: $error');
    }
  }
}
