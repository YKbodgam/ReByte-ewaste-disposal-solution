import 'package:get/get.dart';

import '../../../config/snackbar.dart';
import '../../../services/token_functions/user_service.dart';

class UserController extends GetxController {
  var isLoading = false.obs;

  Rx<dynamic> user = Rx<dynamic>(null);

  Future<void> fetchUserData() async {
    isLoading.value = true;

    try {
      user.value = await UserService.fetchUserData();
    }
    //
    catch (e) {
      SnackWidget.showSnackbar(Get.context!, 'error: ${e.toString()}');
    }
    //
    finally {
      isLoading.value = false;
    }
  }
}
