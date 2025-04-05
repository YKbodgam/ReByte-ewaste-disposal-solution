import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../views/profile_page.dart';
import '../../../../utils/palette.dart';

import '../../../../common/widget/custom_text.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';
import '../../../authentication/models/user_model.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            strokeAlign: BorderSide.strokeAlignInside,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFB6C7AA).withAlpha(100),
              Color(0xFFB6C7AA).withAlpha(0),
            ],
          ),
        ),
        width: double.infinity,
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                spacing: 8.w,
                children: [
                  Icon(Iconsax.location),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildText(
                        text: "Your Location",
                        fontSize: FontSizes.mediumSmallTextSize(context),
                        textStyle: LoraTextStyle.appTextStyleBold,
                      ),
                      BuildText(
                        text: "Complete Your Profile",
                        fontSize: FontSizes.labelLargeTextSize(context),
                        textStyle: LoraTextStyle.appTextStyleMediumItalic,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton.filledTonal(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Palette.kSecondaryLightColor,
                  ),
                ),
                onPressed: () {
                  Get.to(() => ProfilePage(user: user));
                },
                icon: Icon(Iconsax.warning_2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
