import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final double? height;

  const CustomLogo({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/identification/app_logo_horizontal.png',
      height: height ?? 55,
      fit: BoxFit.cover,
    );
  }
}
