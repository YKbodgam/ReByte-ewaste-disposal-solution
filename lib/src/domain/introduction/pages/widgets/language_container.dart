import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class LanguageContainer extends StatelessWidget {
  final Map<String, String> language;
  final bool isSelected;

  const LanguageContainer({
    super.key,
    required this.isSelected,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.008),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.03,
      ),
      decoration: BoxDecoration(
        gradient:
            isSelected
                ? LinearGradient(
                  colors: [
                    Palette.kPrimaryLightColor.withOpacity(0.6),
                    Palette.kSecondaryLightColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                : null,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: isSelected ? Palette.kPrimaryLightColor : Colors.grey,
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color:
                        isSelected ? Palette.kPrimaryLightColor : Colors.grey,
                    width: 2.0,
                  ),
                ),
                child: Center(
                  child: Icon(
                    isSelected ? Icons.check : null,
                    color: isSelected ? Colors.black : Colors.white,
                    size: 18.0,
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.02),
              BuildText(
                text: language['name']!,
                fontSize: FontSizes.mediumSmallTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleBold,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.005,
              horizontal: size.width * 0.05,
            ),
            child: BuildText(
              text: " ~  ${language['sampleHeading']!}",
              fontSize: FontSizes.mediumTextSize(context),
              textStyle: MerriweatherTextStyle.appTextStyleBoldItalic,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: BuildText(
              text: language['sampleSubHeading']!,
              fontSize: FontSizes.mediumTextSize(context),
              textStyle: SpaceTextStyle.appTextStyleMedium,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BuildText(
                text: language['Country']!,
                fontSize: FontSizes.mediumSmallTextSize(context),
                textStyle: SpaceTextStyle.appTextStyleBold,
              ),
              SizedBox(width: size.width * 0.03),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Palette.kBorderPrimaryColor,
                    width: 1.0,
                  ),
                ),
                child: Image.asset(language['flag']!, width: 25, height: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
