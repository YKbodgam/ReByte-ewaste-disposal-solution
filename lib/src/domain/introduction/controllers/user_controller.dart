import 'package:get/get.dart';

import '../../../config/snackbar.dart';
import '../../../services/token_functions/user_service.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var user = Rxn<UserModel>();

  var errorMessage = ''.obs;

  Future<void> fetchUserData() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final data = await UserService.fetchUserData();
      user.value = UserModel.fromMap(data);
    } catch (error) {
      errorMessage.value = error.toString();
      SnackWidget.showSnackbar(
        Get.context!,
        'Failed to fetch user data: ${errorMessage.value}',
        label: 'Retry',
        onPressed: () async {
          await UserService.fetchUserData();
        },
      );
    } finally {
      isLoading.value = false;
    }
  }
}
