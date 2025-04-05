import 'package:get/route_manager.dart';
import '../../domain/authentication/pages/views/login_screen.dart';
import '../../services/token_functions/hive_service.dart';

final HiveService _hiveService = HiveService();
late String? token;
void fetchToken() {
  token = _hiveService.getToken();
  if (token == null) {
    Get.offAll(() => LoginScreen());
  }
}
