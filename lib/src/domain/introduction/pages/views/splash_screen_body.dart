import 'package:flutter/material.dart';

import '../../../../utils/palette.dart';
import '../widgets/splash_screen_back.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  final bool allowNavigation = false;

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      backgroundColor: Palette.kPrimaryBackgroundColor,
      body: PopScope(canPop: allowNavigation, child: CenteredTextWithPadding()),
    );
  }
}
