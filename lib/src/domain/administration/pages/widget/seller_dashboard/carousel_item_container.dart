import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../../common/widgets/custom_text.dart';

class CarouselItemContainer extends StatelessWidget {
  final Color bgColor;
  final String description;
  final Color buttonBgColor;
  final Color buttonTxtClr;
  final String buttonTxt;
  final Color descriptionTxtClr;
  const CarouselItemContainer({
    super.key,
    required this.descriptionTxtClr,
    required this.bgColor,
    required this.description,
    required this.buttonBgColor,
    required this.buttonTxtClr,
    required this.buttonTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        width: double.infinity,

        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
              color: descriptionTxtClr,
              maxLines: 5,
              alignment: TextAlign.left,
              text: description,
              fontSize: FontSizes.mediumSmallTextSize(context),
              textStyle: LoraTextStyle.appTextStyleBold,
            ),
            SizedBox(height: 15.h),
            ElevatedButton(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                backgroundColor: WidgetStatePropertyAll(buttonBgColor),
                fixedSize: WidgetStatePropertyAll(Size(140.w, 20.h)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              onPressed: () {},
              child: BuildText(
                color: buttonTxtClr,
                text: buttonTxt,
                fontSize: FontSizes.labelLargeTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
