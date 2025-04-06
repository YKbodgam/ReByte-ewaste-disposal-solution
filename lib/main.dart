import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'src/services/token_functions/hive_service.dart';

void main() async {
  // Ensure Flutter engine is initialized before any async code
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Show splash screen until initialization is complete
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Load environment variables from .env file
  await dotenv.load();

  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Hive and open required box
  await Hive.initFlutter();
  await Hive.openBox('authBox');

  // Fetch locale (default to English if not found)
  HiveService hiveService = HiveService();
  String locale = hiveService.getLocale() ?? 'en';

  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Remove splash and launch the app
  FlutterNativeSplash.remove();
  runApp(MyApp(locale: locale));
}
