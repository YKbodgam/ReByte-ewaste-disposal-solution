import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'src/utils/palette.dart';
import 'src/utils/locale_string.dart';
import 'src/domain/introduction/controllers/user_controller.dart';
import 'src/domain/introduction/pages/views/splash_screen_body.dart';

class MyApp extends StatelessWidget {
  final String locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    Get.put(UserController(), permanent: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Re-Byte",
      themeMode: ThemeMode.system,
      translations: LocaleString(),
      locale: Locale(locale),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Palette.kSecondaryDarkColor,
          selectionColor: Palette.kSecondaryDarkColor.withAlpha(100),
          selectionHandleColor: Palette.kSecondaryDarkColor,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
