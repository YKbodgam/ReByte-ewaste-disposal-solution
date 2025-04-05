import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../../../../common/widget/custom_text.dart';
import '../../../../../common/widget/regular_button.dart';
import '../../../../business/pages/views/selling_page.dart';

import '../../../../../utils/palette.dart';

import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';

class FunctionContainer extends StatelessWidget {
  const FunctionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 40.w,
        right: 40.w,
        top: 40.w,
        bottom: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: SpaceTextStyle.appTextStyleBold.copyWith(
                fontSize: FontSizes.largeTextSize(context),
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: 'SCRAP NOW',
                  style: TextStyle(color: Colors.green),
                ),
              ],
              text: 'SELL YOUR ',
            ),
          ),
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              style: SpaceTextStyle.appTextStyleRegular.copyWith(
                fontSize: FontSizes.mediumSmallTextSize(context),
              ),
              children: <InlineSpan>[
                TextSpan(
                  text: 'Rebyte',
                  style: SpaceTextStyle.appTextStyleBold.copyWith(
                    color: Colors.green,
                    fontSize: FontSizes.mediumSmallTextSize(context),
                  ),
                ),
                TextSpan(text: ' and uplift the environment'),
              ],
              text: "Let's sell E-waste throguh ",
            ),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () {
              Get.to(() => EWasteListingForm());
            },
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(100.w, 20.h)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              backgroundColor: WidgetStatePropertyAll(Colors.green.shade600),
            ),
            child: BuildText(
              color: Palette.kPrimaryNeutralColor,
              text: "Sell Now",
              fontSize: FontSizes.labelLargeTextSize(context),
              textStyle: SpaceTextStyle.appTextStyleBold,
            ),
          ),
        ],
      ),
    );
  }
}
