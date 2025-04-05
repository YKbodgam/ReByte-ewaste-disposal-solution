import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/create_listing_controller.dart';
import '../../../../../utils/palette.dart';
import '../../../../../utils/text_size.dart';
import '../../../../../utils/text_styles.dart';

import '../../../../../common/widget/custom_text.dart';
import '../../../../../common/widget/custom_text_field.dart';

class BasicDetailsTab extends StatelessWidget {
  final CreateListingController createListingController;
  const BasicDetailsTab({super.key, required this.createListingController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          spacing: 145.h,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                CustomTextField(
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  hintText: "Product Title",
                  controller: createListingController.title,
                  labelText: "Title",
                ),
                CustomTextField(
                  focusedBorderColor: Palette.kBorderPrimaryColor,
                  controller: createListingController.description,
                  hintText: "Product Description",
                  labelText: "Description",
                  maxlines: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150.sp,
                      child: CustomTextField(
                        focusedBorderColor: Palette.kBorderPrimaryColor,
                        controller: createListingController.quantity,
                        labelText: "Quantity",
                        hintText: "Product Quantity",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          width: 150.sp,
                          child: DropdownButtonFormField(
                            dropdownColor: Palette.kPrimaryNeutralColor,
                            value: createListingController.units.value,
                            items:
                                ["kg", "g", "liters", "pieces", "packs"]
                                    .map(
                                      (unit) => DropdownMenuItem(
                                        value: unit,
                                        child: Text(
                                          unit.capitalize!,
                                          style: MerriweatherTextStyle
                                              .appTextStyleRegular
                                              .copyWith(
                                                fontSize:
                                                    FontSizes.mediumSmallTextSize(
                                                      context,
                                                    ),
                                                color:
                                                    Palette.kTextSecondaryColor,
                                              ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged:
                                (value) =>
                                    createListingController.units.value =
                                        value!,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
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
                      ),
                    ),
                  ],
                ),

                Obx(
                  () => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: DropdownButtonFormField(
                      dropdownColor: Palette.kPrimaryNeutralColor,
                      value: createListingController.category.value,
                      items:
                          ["Mobile", "Laptop", "Battery", "Other"]
                              .map(
                                (cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Text(
                                    cat,
                                    style: MerriweatherTextStyle
                                        .appTextStyleRegular
                                        .copyWith(
                                          fontSize:
                                              FontSizes.mediumSmallTextSize(
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
                              createListingController.category.value = value!,
                      decoration: InputDecoration(
                        hintText: "Select Category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: Colors.grey,
                          ),
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
                ),
                Obx(
                  () =>
                      createListingController.category.value == "Other"
                          ? CustomTextField(
                            focusedBorderColor: Palette.kBorderPrimaryColor,
                            controller: createListingController.customCategory,
                            labelText: "Explain Category",
                            hintText: "Enter Category",
                          )
                          : SizedBox.shrink(),
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
                    DefaultTabController.of(context).animateTo(0);
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
                        text: "Next",
                        fontSize: FontSizes.mediumTextSize(context),
                        textStyle: SpaceTextStyle.appTextStyleBold,
                      ),
                    ],
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
