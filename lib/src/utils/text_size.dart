import 'package:flutter/material.dart';

class FontSizes {
  //

  static double veryLargeTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.07; // 28

  static double largeTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.06; // 24

  static double regularTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.05; // 20

  static double mediumLargeTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.045; // 18

  static double mediumTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04; // 16

  static double mediumSmallTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.035; // 14

  static double labelLargeTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.03; // 12

  static double labelMediumTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.025; // 10

  static double labelSmallTextSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02; // 8
}
