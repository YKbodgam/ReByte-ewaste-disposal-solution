import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onpress;

  const ProfileTile({
    super.key,
    required this.size,
    required this.icon,
    required this.name,
    required this.onpress,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onpress(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, size: 24),
                  SizedBox(width: size.width * 0.03),
                  BuildText(
                    text: name,
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleMedium,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                      color:
                          name == 'Log Out'
                              ? Colors.red.withAlpha(100)
                              : Palette.kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      size: 20,
                      Iconsax.arrow_right_3,
                      color: Palette.kPrimaryDarkColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
