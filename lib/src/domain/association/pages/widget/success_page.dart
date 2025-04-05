import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../administration/pages/views/home_page.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';
import '../../../../common/widgets/custom_text.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    _redirectToHome();
  }

  Timer? _timer;
  void _redirectToHome() {
    _timer = Timer(Duration(seconds: 2), () {
      if (mounted) {
        Get.off(() => HomePage());
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryNeutralColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100.sp),
              SizedBox(height: 20.h),
              BuildText(
                text: "Listing Submitted Successfully!",
                fontSize: FontSizes.mediumLargeTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleBold,
              ),
              SizedBox(height: 10.h),
              BuildText(
                alignment: TextAlign.center,
                text: "Please wait while we are processing your request.",
                fontSize: FontSizes.mediumSmallTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleLight,
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 250.w,
                child: LinearProgressIndicator(
                  color: Palette.kPrimaryDarkAccent,
                  backgroundColor: Palette.kPrimaryBackgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
