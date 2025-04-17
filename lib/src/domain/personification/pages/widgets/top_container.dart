import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rebyte/src/domain/authentication/models/user_model.dart';

import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';
import '../../../../common/widgets/custom_text.dart';

class TopContainer extends StatelessWidget {
  final UserModel userDetail;

  const TopContainer({required this.userDetail, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Palette.kPrimaryBackgroundColor,
      ),
      height: size.height * 0.24,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: -size.height * 0.05,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(50, 50, 93, 0.25),
                    blurRadius: 12,
                    spreadRadius: -2,
                    offset: Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    blurRadius: 7,
                    spreadRadius: -3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.005),
                child: Container(
                  width: size.height * 0.1,
                  clipBehavior: Clip.antiAlias,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.network(
                    "https://img.freepik.com/free-psd/portrait-man-teenager-isolated_23-2151745771.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: size.height * 0.1),
              BuildText(
                text: userDetail.userFullName,
                fontSize: FontSizes.regularTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleBold,
                color: Palette.kBorderPrimaryColor,
              ),
              SizedBox(height: size.height * 0.01),
              BuildText(
                text: userDetail.userEmailID,
                fontSize: FontSizes.mediumSmallTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleBoldItalic,
                color: Palette.kBorderPrimaryColor,
              ),
              SizedBox(height: size.height * 0.022),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildText(
                    text: userDetail.role == "user" ? "Seller" : "Buyer",
                    fontSize: FontSizes.mediumLargeTextSize(context),
                    textStyle: MerriweatherTextStyle.appTextStyleRegular,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
