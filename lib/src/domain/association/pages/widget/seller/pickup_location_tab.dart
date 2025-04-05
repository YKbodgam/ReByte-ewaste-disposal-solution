import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controllers/listing_controller.dart';

import '../../../../../utils/palette.dart';
import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../../common/widgets/custom_text.dart';
import '../../../../../common/widgets/custom_text_field.dart';

class PickupLocationTab extends StatelessWidget {
  final CreateListingController createListingController;
  const PickupLocationTab({super.key, required this.createListingController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          spacing: 43.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                CustomTextField(
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  keyboardType: TextInputType.streetAddress,
                  hintText: "Address",
                  controller: createListingController.addressController,
                  labelText: "Address",
                ),
                CustomTextField(
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  hintText: "City",
                  controller: createListingController.cityController,
                  labelText: "City",
                ),
                CustomTextField(
                  hintText: "State",
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  controller: createListingController.stateController,
                  labelText: "State",
                ),
                CustomTextField(
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  hintText: "Country",
                  controller: createListingController.countryController,
                  labelText: "Country",
                ),
                CustomTextField(
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  keyboardType: TextInputType.number,
                  hintText: "Zip Code (Postal Code)",
                  controller: createListingController.zipCodeController,
                  labelText: "Pincode",
                ),
                SizedBox(height: 8.h),
                BuildText(
                  text: "OR",
                  fontSize: FontSizes.largeTextSize(context),
                  textStyle: SpaceTextStyle.appTextStyleSemiBold,
                ),
                SizedBox(height: 8.h),
                Obx(() {
                  return ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          createListingController.isLoading.value
                              ? WidgetStatePropertyAll(Size(250.w, 40.h))
                              : null,
                      backgroundColor: WidgetStatePropertyAll(
                        Palette.kPrimaryDarkAccent,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                    ),
                    onPressed: () {
                      createListingController.getCurrentLocation();
                    },

                    child:
                        createListingController.isLoading.value
                            ? SizedBox(
                              height: 25.sp,
                              width: 25.sp,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : BuildText(
                              color: Palette.kSecondaryBackgroundColor,
                              text: "Use Your Current Location",
                              fontSize: FontSizes.mediumLargeTextSize(context),
                              textStyle: SpaceTextStyle.appTextStyleSemiBold,
                            ),
                  );
                }),

                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: BuildText(
                    alignment: TextAlign.center,
                    text:
                        "Use our Current Location Feature. Because it help us recommend your E-waste to your nearby Recyclers",
                    fontSize: FontSizes.labelMediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleBold,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
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
                  child: BuildText(
                    color: Palette.kBorderSecondaryColor,
                    text: "Prev",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: SpaceTextStyle.appTextStyleBold,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Palette.kSecondaryButtonColor,
                    ),
                    elevation: WidgetStatePropertyAll(0),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    fixedSize: WidgetStatePropertyAll(Size(81.w, 35.h)),
                  ),
                  onPressed: () {
                    DefaultTabController.of(context).animateTo(3);
                  },
                  child: BuildText(
                    color: Palette.kBorderSecondaryColor,
                    text: "Next",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: SpaceTextStyle.appTextStyleBold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
