import 'package:get/route_manager.dart';
import '../../domain/authentication/pages/views/login_screen.dart';
import '../../services/token_functions/hive_service.dart';
import 'dart:convert';

final HiveService _hiveService = HiveService();

late String? token;
late String? role;
late String? email;

void fetchToken() {
  token = _hiveService.getToken();
  if (token == null) {
    Get.offAll(() => LoginScreen());
  } else {
    final payload = decodeJwtPayload(token!);
    role = payload['role'];
    email = payload['email'];
  }
}

Map<String, dynamic> decodeJwtPayload(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('Invalid JWT token');
  }

  final payload = parts[1];
  final normalized = base64Url.normalize(payload);
  final decodedBytes = base64Url.decode(normalized);
  final decodedString = utf8.decode(decodedBytes);
  return json.decode(decodedString);
}
