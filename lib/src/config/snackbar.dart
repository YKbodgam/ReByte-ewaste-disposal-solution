import 'package:flutter/material.dart';

class SnackWidget {
  static void showSnackbar(
    BuildContext context,
    String message, {
    String label = 'Ok',
    void Function()? onPressed,
  }) {
    final scaffold = ScaffoldMessenger.of(context);

    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: label,
          onPressed: onPressed ?? () => scaffold.hideCurrentSnackBar(),
        ),
      ),
    );
  }
}
