import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class NeedHelpContainer extends StatelessWidget {
  const NeedHelpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      child: Container(
        height: 60.h,
        width: double.infinity,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),

          border: Border.all(color: Colors.grey, width: 1.5.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Icon(Iconsax.headphone),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Need Help?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Chat with us about your issue...",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Iconsax.arrow_right_1),
            ),
          ],
        ),
      ),
    );
  }
}
