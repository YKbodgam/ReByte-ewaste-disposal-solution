import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../introduction/controllers/user_controller.dart';
import '../../../../utils/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/app_advertise_container.dart';
import '../widget/did_you_know_container.dart';
import '../widget/need_help_container.dart';
import '../widget/seller_dashboard/function_container.dart';
import '../widget/seller_dashboard/top_event_carousal.dart';
import '../widget/seller_dashboard/usp_container.dart';
import '../widget/top_part.dart';

class HomePage extends StatelessWidget {
  final userController = Get.find<UserController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.kPrimaryNeutralColor,

      body: ListView(
        children: [
          TopPart(user: userController.user.value!),
          FunctionContainer(),
          TopCarousal(),
          UspContainer(),
          SizedBox(height: 8.h),
          DidYouKnowContainer(),
          SizedBox(height: 14.h),
          NeedHelpContainer(),
          SizedBox(height: 14.h),
          AppAdvertiseContainer(),
        ],
      ),
    );
  }
}
