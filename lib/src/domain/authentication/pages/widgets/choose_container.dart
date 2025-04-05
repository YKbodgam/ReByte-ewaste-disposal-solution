import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class ChooseContainer extends StatelessWidget {
  final int index;
  final bool isSelected;

  const ChooseContainer({
    super.key,
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> choices = ["choiceIndividual".tr, "choiceOrganization".tr];

    return Container(
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
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: isSelected ? Palette.kPrimaryLightColor : Colors.grey,
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
          index == 0
              ? Center(
                child: Image.asset(
                  'assets/images/authentication/img_signup_1.png',
                  height: size.height * 0.1,
                ),
              )
              : Center(
                child: Image.asset(
                  'assets/images/authentication/img_signup_2.png',
                  height: size.height * 0.1,
                ),
              ),
          SizedBox(height: size.height * 0.01),
          Center(
            child: BuildText(
              text: choices[index],
              fontSize: FontSizes.mediumLargeTextSize(context),
              textStyle: SpaceTextStyle.appTextStyleBold,
            ),
          ),
        ],
      ),
    );
  }
}
