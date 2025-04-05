import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/text_styles.dart';
import '../../../../common/widgets/custom_text.dart';

class AppAdvertiseContainer extends StatelessWidget {
  const AppAdvertiseContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildText(
            color: Colors.grey,
            alignment: TextAlign.start,
            text: "India's E-waste\nCollection App",
            fontSize: 35.sp,
            textStyle: SpaceTextStyle.appTextStyleBold,
          ),
          SizedBox(height: 10.h),
          Divider(endIndent: 20.w),
          BuildText(
            color: Colors.green.shade700,
            alignment: TextAlign.start,
            text: "ReByte",
            fontSize: 30.sp,
            textStyle: SpaceTextStyle.appTextStyleBold,
          ),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
