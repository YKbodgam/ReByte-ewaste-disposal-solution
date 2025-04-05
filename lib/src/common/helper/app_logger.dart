import 'dart:developer';

class AppLogger {
  static bool isLoggingEnabled = true;

  static void customLog(String message) {
    if (isLoggingEnabled) {
      log(message);
    }
  }

  static void error(String message) {
    if (isLoggingEnabled) {
      log("ERROR: $message");
    }
  }

  static void warning(String message) {
    if (isLoggingEnabled) {
      log("WARNING: $message");
    }
  }
}
