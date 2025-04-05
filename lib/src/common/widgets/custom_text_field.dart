import 'package:flutter/material.dart';

import '../../utils/palette.dart';
import '../../utils/text_size.dart';
import '../../utils/text_styles.dart';

class CustomTextField extends StatefulWidget {
  //
  final int? maxLength;
  final int? maxlines;

  final bool? obscureText;

  final Color? backgroundColor;
  final Color? focusedBorderColor;
  final TextEditingController? controller;

  final double? height;
  final double? borderRadius;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  final String labelText;
  final String hintText;
  final EdgeInsets? contentPadding;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    this.maxLength,
    this.maxlines = 1,
    this.keyboardType = TextInputType.text,
    this.height,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.labelText,
    this.backgroundColor,
    this.focusedBorderColor,
    this.controller,
    this.validator,
    this.onChanged,
    this.contentPadding,
    this.obscureText,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: widget.height,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: TextFormField(
        maxLines: widget.maxlines,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,

        obscureText: widget.obscureText ?? false,

        textAlignVertical: TextAlignVertical.center,
        scrollPhysics: BouncingScrollPhysics(),
        enableInteractiveSelection: true,

        // Controller
        controller: widget.controller,
        focusNode: focusNode,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          counterText: "",
          // Bckground Decoration
          filled: widget.backgroundColor != null,
          fillColor: widget.backgroundColor,

          // Icon Decoration
          // Icon Decoration
          prefixIcon:
              widget.prefixIcon != null
                  ? IconTheme(
                    data: IconThemeData(
                      color:
                          isFocused ? widget.focusedBorderColor : Colors.grey,
                    ),
                    child: widget.prefixIcon!,
                  )
                  : null,

          suffixIcon:
              widget.suffixIcon != null
                  ? IconTheme(
                    data: IconThemeData(
                      color:
                          isFocused ? widget.focusedBorderColor : Colors.grey,
                    ),
                    child: widget.suffixIcon!,
                  )
                  : null,

          // Border Decoration
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(width: 1.0, color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(width: 1.0, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(
              width: 1.5,
              color: widget.focusedBorderColor ?? Palette.kBorderSecondaryColor,
            ),
          ),

          // Text Decoration
          hintText: isFocused ? null : widget.hintText,
          labelText: isFocused ? widget.labelText : null,
          hintStyle: MerriweatherTextStyle.appTextStyleRegular.copyWith(
            fontSize: FontSizes.mediumSmallTextSize(context),
            color: Palette.kTextSecondaryColor,
          ),
          labelStyle: MerriweatherTextStyle.appTextStyleRegular.copyWith(
            fontSize: FontSizes.mediumSmallTextSize(context),
            color: widget.focusedBorderColor,
          ),

          // Padding Decoration
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(
                horizontal: size.width * 0.04,
                vertical: size.height * 0.02,
              ),
        ),

        // Validator
        validator: widget.validator,
      ),
    );
  }
}
