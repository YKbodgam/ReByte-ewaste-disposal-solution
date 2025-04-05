import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../success_page.dart';
import '../../../controllers/listing_controller.dart';

import '../../../../../utils/palette.dart';
import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';
import '../../../../../common/widgets/custom_text.dart';
import '../../../../../common/widgets/custom_text_field.dart';

class ListingTypeTab extends StatelessWidget {
  final CreateListingController createListingController;
  const ListingTypeTab({super.key, required this.createListingController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Obx(
                () => DropdownButtonFormField(
                  dropdownColor: Palette.kPrimaryNeutralColor,
                  value: createListingController.listingType.value,
                  items:
                      ["donation", "selling", "exchange"]
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(
                                type.capitalize!,
                                style: MerriweatherTextStyle.appTextStyleRegular
                                    .copyWith(
                                      fontSize: FontSizes.mediumSmallTextSize(
                                        context,
                                      ),
                                      color: Palette.kTextSecondaryColor,
                                    ),
                              ),
                            ),
                          )
                          .toList(),
                  onChanged:
                      (value) =>
                          createListingController.listingType.value = value!,
                  decoration: InputDecoration(
                    hintText: "Listing Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Palette.kBorderPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () =>
                    createListingController.listingType.value == "selling"
                        ? CustomTextField(
                          focusedBorderColor: Palette.kBorderPrimaryColor,
                          hintText: "Product Price",
                          controller: createListingController.price,
                          labelText: "Price",
                          keyboardType: TextInputType.number,
                        )
                        : SizedBox.shrink(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
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
                    DefaultTabController.of(context).animateTo(2);
                  },
                  child: Row(
                    children: [
                      BuildText(
                        color: Palette.kBorderSecondaryColor,
                        text: "Prev",
                        fontSize: FontSizes.mediumTextSize(context),
                        textStyle: SpaceTextStyle.appTextStyleBold,
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return createListingController.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Palette.kPrimaryDarkAccent,
                          ),
                          elevation: WidgetStatePropertyAll(0),
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                        ),
                        onPressed: () async {
                          await createListingController.createListing();
                          Get.to(() => SuccessPage());
                        },
                        child: BuildText(
                          color: Palette.kPrimaryNeutralColor,
                          text: "Submit",
                          fontSize: FontSizes.mediumTextSize(context),
                          textStyle: SpaceTextStyle.appTextStyleBold,
                        ),
                      );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
