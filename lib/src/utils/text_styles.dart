import 'package:flutter/material.dart';

// Headings: Space Grotesk (bold)

// Subheadings: Lora (semi-bold)

// Body text: Merriweather (regular)

// Buttons & UI Elements: Space Grotesk (medium/semi-bold)

// Quotes & Highlights: Lora (italic)

class MerriweatherTextStyle {
  // Merriweather text style

  static TextStyle appTextStyleLight = TextStyle(
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w300, // Light
  );

  static TextStyle appTextStyleLightItalic = TextStyle(
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic, // Light Italic
  );

  static TextStyle appTextStyleRegular = TextStyle(
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w400, // Regular
  );

  static TextStyle appTextStyleItalic = TextStyle(
    fontFamily: 'Merriweather',
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400, // Regular Italic
  );

  static TextStyle appTextStyleBold = TextStyle(
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w700, // Bold
  );

  static TextStyle appTextStyleBoldItalic = TextStyle(
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w700, // Bold
    fontStyle: FontStyle.italic, // Bold Italic
  );
}

class LoraTextStyle {
  // Lora text style
  static TextStyle appTextStyleRegular = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w400, // Regular
  );

  static TextStyle appTextStyleItalic = TextStyle(
    fontFamily: 'Lora',
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400, // Regular Italic
  );

  static TextStyle appTextStyleMedium = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w500, // Medium
  );

  static TextStyle appTextStyleMediumItalic = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic, // Medium Italic
  );

  static TextStyle appTextStyleSemiBold = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w600, // SemiBold
  );

  static TextStyle appTextStyleSemiBoldItalic = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic, // SemiBold Italic
  );

  static TextStyle appTextStyleBold = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w700, // Bold
  );

  static TextStyle appTextStyleBoldItalic = TextStyle(
    fontFamily: 'Lora',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic, // Bold Italic
  );
}

class SpaceTextStyle {
  // Space Grotesk text style

  static TextStyle appTextStyleLight = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w300, // Regular
  );

  static TextStyle appTextStyleRegular = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w400, // Regular Italic
  );

  static TextStyle appTextStyleMedium = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w500, // Medium
  );

  static TextStyle appTextStyleSemiBold = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w600, // SemiBold
  );

  static TextStyle appTextStyleBold = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w700, // Bold
  );
}
