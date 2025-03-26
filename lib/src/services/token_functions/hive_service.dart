import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static const String authBoxName = 'authBox';
  static const String tokenKey = 'token';
  static const String emailKey = 'email';
  static const String localeKey = 'locale';
  static const String expiryKey = 'expiryDate';

  // Save token and expiry date
  Future<void> saveToken(String token, DateTime expiryDate) async {
    // log("Saving Token : $token");
    final box = Hive.box(authBoxName);
    await box.put(tokenKey, token);
    await box.put(expiryKey, expiryDate.toIso8601String());
  }

  Future<void> saveEmail(String email, DateTime expiryDate) async {
    // log("Saving Token : $email");
    final box = Hive.box(authBoxName);
    await box.put(emailKey, email);
    await box.put(expiryKey, expiryDate.toIso8601String());
  }

  Future<void> saveLocale(String locale, DateTime expiryDate) async {
    // log("Saving Token : $locale");
    final box = Hive.box(authBoxName);
    await box.put(localeKey, locale);
    await box.put(expiryKey, expiryDate.toIso8601String());
  }

  // Get token from Hive
  String? getToken() {
    final box = Hive.box(authBoxName);
    return box.get(tokenKey);
  }

  String? getEmail() {
    final box = Hive.box(authBoxName);
    return box.get(emailKey);
  }

  String? getLocale() {
    final box = Hive.box(authBoxName);
    return box.get(localeKey);
  }

  // Get expiry date from Hive
  DateTime? getExpiryDate() {
    final box = Hive.box(authBoxName);
    final expiryDateStr = box.get(expiryKey);
    return expiryDateStr != null ? DateTime.parse(expiryDateStr) : null;
  }

  // Clear token and expiry date when user signout
  Future<void> clearToken() async {
    final box = Hive.box(authBoxName);
    await box.delete(tokenKey);
    await box.delete(emailKey);
    await box.delete(expiryKey);
    await box.delete(localeKey);
  }
}
