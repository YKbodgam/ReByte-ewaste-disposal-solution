import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/snackbar.dart';
import '../../domain/authentication/models/user_model.dart';
import '../../domain/authentication/models/organisation_model.dart';
import '../../domain/authentication/pages/views/login_screen.dart';

import '../token_constant/api_constant.dart';
import 'hive_service.dart';

class UserService {
  //

  static Future<dynamic> fetchUserData() async {
    final url = Uri.parse('${ApiConstants.tokenBaseUrl}/api/profile/');

    final hiveService = HiveService();
    final token = hiveService.getToken();

    if (token != null) {
      //

      try {
        final response = await http.get(
          url,
          headers: {'Authorization': 'Bearer $token'},
        );

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);

          if (jsonData['role'] == 'user') {
            return UserModel.fromMap(jsonData);
          }
          //
          else {
            return OrganizationModel.fromMap(jsonData);
          }
        }
        //
        else {
          final jsonData = json.decode(response.body);

          SnackWidget.showSnackbar(
            Get.context!,
            'Failed to fetch user data: ${jsonData['message']}',
            label: 'Retry',
            onPressed: () => fetchUserData(),
          );

          return null;
        }
      }
      //
      catch (error) {
        SnackWidget.showSnackbar(
          Get.context!,
          'Failed to fetch user data: $error',
          label: 'Retry',
          onPressed: () => fetchUserData(),
        );

        return null;
      }
    }
    //
    else {
      Get.offAll(() => LoginScreen());
    }
  }
}
