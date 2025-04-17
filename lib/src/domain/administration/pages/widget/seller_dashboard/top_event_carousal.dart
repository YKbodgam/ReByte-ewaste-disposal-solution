import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'carousel_item_container.dart';
import '../../../../../utils/palette.dart';
import '../../../../../common/widgets/custom_carousal.dart';

class TopCarousal extends StatelessWidget {
  const TopCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 170.h,
            child: CustomCarousal(
              carouselHeight: 135.h,
              items: [
                CarouselItemContainer(
                  descriptionTxtClr: Palette.kSecondaryDarkAccent,
                  bgColor: Palette.kSecondaryDarkColor,
                  buttonTxt: "Book Pick up",
                  buttonBgColor: Palette.kSecondaryDarkAccent,
                  buttonTxtClr: Palette.kPrimaryNeutralColor,
                  description:
                      "Got 100kg of E-Waste to dispose?\nBook a pick up now and we will be at your doorstep in no time!",
                ),
                CarouselItemContainer(
                  descriptionTxtClr: Palette.kBorderPrimaryColor,
                  bgColor: Palette.kSecondaryBackgroundColor,
                  buttonTxt: "Explore Now",
                  buttonBgColor: Palette.kBorderPrimaryColor,
                  buttonTxtClr: Palette.kPrimaryNeutralColor,
                  description:
                      "See what other's are selling?\nExplore now the deals around you!\n",
                ),
                CarouselItemContainer(
                  descriptionTxtClr: Palette.kBorderPrimaryColor,
                  bgColor: Palette.kPrimaryBackgroundColor,
                  buttonTxt: "Register Now",
                  buttonBgColor: Palette.kBorderPrimaryColor,
                  buttonTxtClr: Palette.kPrimaryNeutralColor,
                  description:
                      "Want to sell E-waste of whole society?\nRegister now and get money directly in your account!",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
