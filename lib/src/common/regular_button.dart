import 'package:flutter/material.dart';

import 'custom_text.dart';
import '../utils/palette.dart';
import '../utils/text_size.dart';
import '../utils/text_styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color? textColor;

  final bool loading;
  final bool isborder;

  final double? width;
  final double? height;
  final double? fontsize;
  final double borderRadius;

  final Color? iconColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final Color? bordercolor;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.loading = false,
    this.isborder = false,
    this.fontsize,
    this.bordercolor,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius = 30.0,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.backgroundColor = Palette.kPrimaryDarkColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: width,
      height: height ?? size.height * 0.065,
      child: ElevatedButton(
        onPressed: loading ? null : () => onPressed(),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side:
                isborder
                    ? BorderSide(color: bordercolor ?? Colors.white, width: 1.5)
                    : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Palette.kPrimaryNeutralColor,
                ),
              ),
            if (prefixIcon != null && !loading) ...[
              Icon(prefixIcon, color: iconColor, size: 18),
              const SizedBox(width: 8.0),
            ],
            if (!loading)
              BuildText(
                text: text,
                textStyle: MerriweatherTextStyle.appTextStyleRegular,
                fontSize: fontsize ?? FontSizes.mediumSmallTextSize(context),
                color:
                    isborder
                        ? bordercolor ?? Palette.kBorderPrimaryColor
                        : textColor ?? Palette.kPrimaryNeutralColor,
              ),
            if (suffixIcon != null && !loading) ...[
              const SizedBox(width: 8.0),
              Icon(suffixIcon, color: iconColor, size: 18),
            ],
          ],
        ),
      ),
    );
  }
}
