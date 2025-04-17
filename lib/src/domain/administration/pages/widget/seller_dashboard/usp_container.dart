import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/palette.dart';
import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../../common/widgets/custom_text.dart';

class UspContainer extends StatelessWidget {
  const UspContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Palette.kPrimaryBackgroundColor.withAlpha(0),
              Palette.kPrimaryBackgroundColor.withAlpha(150),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              spacing: 4.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    color: Palette.kBorderSecondaryColor,
                  ),
                  padding: EdgeInsets.all(10.sp),

                  child: Icon(
                    Iconsax.tree,
                    color: Palette.kPrimaryNeutralColor,
                    size: 30.sp,
                  ),
                ),
                BuildText(
                  text: "Eco-Friendly\n ",
                  fontSize: FontSizes.labelLargeTextSize(context),
                  textStyle: MerriweatherTextStyle.appTextStyleRegular,
                  alignment: TextAlign.center,
                ),
              ],
            ),
            Column(
              spacing: 4.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    color: Palette.kBorderSecondaryColor,
                  ),
                  padding: EdgeInsets.all(10.sp),

                  child: Icon(
                    Icons.currency_rupee,
                    color: Palette.kPrimaryNeutralColor,
                    size: 30.sp,
                  ),
                ),
                BuildText(
                  text: "AI based \nFair Pricing",
                  fontSize: FontSizes.labelLargeTextSize(context),
                  textStyle: MerriweatherTextStyle.appTextStyleRegular,
                  alignment: TextAlign.center,
                ),
              ],
            ),
            Column(
              spacing: 4.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    color: Palette.kBorderSecondaryColor,
                  ),
                  padding: EdgeInsets.all(10.sp),

                  child: Icon(
                    Iconsax.truck_fast,
                    color: Palette.kPrimaryNeutralColor,
                    size: 30.sp,
                  ),
                ),
                BuildText(
                  text: "Doorstep \nPickup",
                  fontSize: FontSizes.labelLargeTextSize(context),
                  textStyle: MerriweatherTextStyle.appTextStyleRegular,
                  alignment: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
