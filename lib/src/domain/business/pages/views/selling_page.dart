import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widget/custom_text.dart';

import '../../../../common/widget/custom_text_field.dart';
import '../../controllers/create_listing_controller.dart';
import '../widget/seller/basic_details_tab.dart';
import '../widget/seller/image_upload_tab.dart';
import '../widget/seller/listing_type_tab.dart';
import '../widget/seller/pickup_location_tab.dart';
import '../../../../utils/palette.dart';
import '../../../../utils/text_size.dart';
import '../../../../utils/text_styles.dart';

class EWasteListingForm extends StatelessWidget {
  final CreateListingController controller = Get.put(CreateListingController());

  EWasteListingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 1.sp,
          automaticallyImplyLeading: false,
          leading: IconButton(
            iconSize: 24.sp,
            icon: Icon(Iconsax.arrow_left_2),
            onPressed: () => Get.back(),
          ),
          centerTitle: false,
          title: BuildText(
            text: "Add E-Waste",
            fontSize: FontSizes.mediumLargeTextSize(context),
            textStyle: MerriweatherTextStyle.appTextStyleRegular,
          ),
          bottom: TabBar(
            overlayColor: WidgetStatePropertyAll(Palette.kPrimaryLightColor),
            splashBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            indicatorColor: Palette.kPrimaryDarkColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: [
              Tab(
                child: BuildText(
                  text: "Image Upload",
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleRegular,
                ),
              ),
              Tab(
                child: BuildText(
                  text: "Basic Details",
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleRegular,
                ),
              ),
              Tab(
                child: BuildText(
                  text: "Pick-Up Location",
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleRegular,
                ),
              ),
              Tab(
                child: BuildText(
                  text: "Listing Type",
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleRegular,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ImageUploadTab(createListingController: controller),
            BasicDetailsTab(createListingController: controller),
            PickupLocationTab(createListingController: controller),
            ListingTypeTab(createListingController: controller),
          ],
        ),
      ),
    );
  }
}
