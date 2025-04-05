import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class OnBoardingBack extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnBoardingBack({
    super.key,
    required this.size,
    required this.image,
    required this.title,
    required this.description,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.15),
          SvgPicture.asset(image, height: size.height * 0.4),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
            child: BuildText(
              text: title,
              maxLines: 3,
              fontSize: FontSizes.regularTextSize(context),
              textStyle: LoraTextStyle.appTextStyleBold,
              color: Palette.kTextPrimaryColor,
              alignment: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: BuildText(
              maxLines: 10,
              text: description,
              fontSize: FontSizes.mediumTextSize(context),
              textStyle: LoraTextStyle.appTextStyleMedium,
              color: Palette.kTextSecondaryColor,
              alignment: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
