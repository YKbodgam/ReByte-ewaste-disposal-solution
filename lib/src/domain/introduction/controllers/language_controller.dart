import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../services/token_functions/hive_service.dart';

class LanguageChangeController extends GetxController {
  //

  var selectedIndex = 0.obs;

  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  var appLocale = Locale('en').obs;
  final HiveService _hiveService = HiveService();

  // Hard coded for 15 days
  final expiryDate = DateTime.now().add(Duration(seconds: 1296000));

  void changeLanguage(String locale) async {
    appLocale.value = Locale(locale);
    Get.updateLocale(appLocale.value); // Update the locale using GetX

    await _hiveService.saveLocale(locale, expiryDate);
  }
}
