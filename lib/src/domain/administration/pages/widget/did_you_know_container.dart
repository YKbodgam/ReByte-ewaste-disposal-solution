import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/widget/custom_carousal.dart';
import '../../../../common/widget/custom_text.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class DidYouKnowContainer extends StatefulWidget {
  const DidYouKnowContainer({super.key});

  @override
  State<DidYouKnowContainer> createState() => _DidYouKnowContainerState();
}

class _DidYouKnowContainerState extends State<DidYouKnowContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyClipper(),
      child: Container(
        width: double.infinity,
        height: 200.h,
        color: Palette.kSecondaryLightColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      endIndent: 15.w,
                    ),
                  ),
                  BuildText(
                    text: "Did you know?",
                    fontSize: FontSizes.mediumLargeTextSize(context),
                    textStyle: SpaceTextStyle.appTextStyleBold,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                      indent: 15.w,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 8.h),
              child: CustomCarousal(
                needIndicator: false,
                carouselHeight: 100.h,
                items: [
                  CarousalItem(
                    fact:
                        "Your old smartphone contains tiny amounts of gold, silver, and copper—recycling it is like mining treasure!",
                  ),
                  CarousalItem(
                    fact:
                        "E-waste is the fastest-growing waste stream in the world, increasing by about 2 million tons per year!",
                  ),
                  CarousalItem(
                    fact:
                        "Only 17.4% of global e-waste is properly recycled, while the rest ends up in landfills, polluting the environment.",
                  ),
                  CarousalItem(
                    fact:
                        "Recycling 1 million laptops saves energy equivalent to powering 3,500 U.S. homes for a year!",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarousalItem extends StatelessWidget {
  final String fact;
  const CarousalItem({super.key, required this.fact});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 250.sp,
      child: BuildText(
        alignment: TextAlign.center,
        color: Palette.kBorderSecondaryColor,
        maxLines: 10,
        text: fact,
        fontSize: FontSizes.mediumLargeTextSize(context),

        textStyle: LoraTextStyle.appTextStyleRegular,
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double waveHeight = 15.0;
    double waveWidth = size.width / 16; // Number of waves

    // ---- Top Waves ----
    path.moveTo(0, waveHeight); // Start slightly below the top
    for (double i = 0; i < size.width; i += waveWidth) {
      path.quadraticBezierTo(i + waveWidth / 2, 0, i + waveWidth, waveHeight);
    }

    path.lineTo(size.width, size.height - waveHeight);

    for (double i = size.width; i > 0; i -= waveWidth) {
      path.quadraticBezierTo(
        i - waveWidth / 2,
        size.height,
        i - waveWidth,
        size.height - waveHeight,
      );
    }

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
