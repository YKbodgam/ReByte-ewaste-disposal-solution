import 'package:flutter/material.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class EwasteCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const EwasteCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Palette.kBorderPrimaryColor, width: 1.5),
      ),
      color: Palette.kSecondaryBackgroundColor,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: LoraTextStyle.appTextStyleBold.copyWith(
                fontSize: FontSizes.mediumLargeTextSize(context),
                color: Palette.kTextPrimaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: LoraTextStyle.appTextStyleRegular.copyWith(
                fontSize: FontSizes.mediumTextSize(context),
                color: Palette.kTextSecondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: SpaceTextStyle.appTextStyleBold.copyWith(
                fontSize: FontSizes.largeTextSize(context),
                color: Palette.kPrimaryDarkAccent,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.kPrimaryButtonColor,
                foregroundColor: Palette.kPrimaryNeutralColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "View Details",
                style: SpaceTextStyle.appTextStyleRegular.copyWith(
                  fontSize: FontSizes.mediumTextSize(context),
                  color: Palette.kPrimaryNeutralColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
