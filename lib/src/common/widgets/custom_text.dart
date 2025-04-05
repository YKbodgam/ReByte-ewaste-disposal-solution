import 'package:flutter/material.dart';

import '../../utils/palette.dart';

class BuildText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextStyle textStyle;

  final int maxLines;
  final TextAlign alignment;

  const BuildText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.textStyle,
    this.color = Palette.kTextPrimaryColor,
    this.maxLines = 2,
    this.alignment = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines, // Allow the text to wrap to a second line if needed
      overflow: TextOverflow.ellipsis, // Add ellipsis to overflowed text
      softWrap: true,
      style: textStyle.copyWith(color: color, fontSize: fontSize),
      textAlign: alignment,
    );
  }
}
