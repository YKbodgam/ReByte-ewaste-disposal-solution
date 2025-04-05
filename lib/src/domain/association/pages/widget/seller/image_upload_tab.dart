import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/listing_controller.dart';

import '../../../../../utils/palette.dart';
import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../../common/widgets/custom_text.dart';

class ImageUploadTab extends StatelessWidget {
  final CreateListingController createListingController;
  const ImageUploadTab({super.key, required this.createListingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: createListingController.pickImages,
                child: ImageUploadContainer(
                  height: 250.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.gallery_add4,
                        size: 50.r,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10.h),
                      BuildText(
                        text: "Upload upto 4 images",
                        fontSize: FontSizes.mediumTextSize(context),
                        textStyle: LoraTextStyle.appTextStyleBold,
                      ),
                      SizedBox(height: 10.h),
                      BuildText(
                        alignment: TextAlign.center,
                        text: "(345x255 or larger recommended,\nupto 1MB each)",
                        fontSize: FontSizes.mediumSmallTextSize(context),
                        textStyle: LoraTextStyle.appTextStyleRegular,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10.w,
                    children:
                        createListingController.images
                            .map(
                              (image) => ImageUploadContainer(
                                height: 60.h,
                                width: 80.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.file(image, fit: BoxFit.cover),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                );
              }),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Palette.kSecondaryButtonColor,
                ),
                elevation: WidgetStatePropertyAll(0),
                visualDensity: VisualDensity.adaptivePlatformDensity,

                fixedSize: WidgetStatePropertyAll(Size(81.w, 35.h)),
              ),
              onPressed: () {
                DefaultTabController.of(context).animateTo(1);
              },
              child: Row(
                children: [
                  BuildText(
                    color: Palette.kBorderSecondaryColor,
                    text: "Next",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: SpaceTextStyle.appTextStyleBold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageUploadContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const ImageUploadContainer({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [10.w, 5.w],
      color: Colors.grey,
      borderType: BorderType.RRect,
      radius: Radius.circular(10.r),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey.shade100,
        ),
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
