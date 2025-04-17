import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rebyte/src/common/helper/match_widget_from_map.dart';
import 'package:rebyte/src/common/widgets/custom_text.dart';
import 'package:rebyte/src/common/widgets/product_listing_card.dart';
import 'package:rebyte/src/domain/segregation/controller/my_ewaste_listings_controller.dart';
import 'package:rebyte/src/utils/palette.dart';
import 'package:rebyte/src/utils/text_size.dart';
import 'package:rebyte/src/utils/text_styles.dart';

import '../../../../common/helper/app_logger.dart';

class MyEwasteListings extends StatelessWidget {
  final String type;
  final myEwasteListingsController = Get.put(MyEwasteListingsController());

  MyEwasteListings({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return matchWidgetFromMap(
      variable: type,
      matchMap: {
        'claimed': Scaffold(
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
              text: "Your E-Waste Listings",
              fontSize: FontSizes.mediumLargeTextSize(context),
              textStyle: MerriweatherTextStyle.appTextStyleRegular,
            ),
          ),
          body: Obx(() {
            if (myEwasteListingsController.claimedListings.isEmpty) {
              AppLogger.customLog(
                myEwasteListingsController.availableListings.isEmpty.toString(),
              );
              return Center(child: Text("No Listings Available"));
            } else {
              return ListView.builder(
                itemCount: myEwasteListingsController.claimedListings.length,
                itemBuilder: (context, index) {
                  final item =
                      myEwasteListingsController.claimedListings[index];

                  return ProductListingCard(listing: item, type: type);
                },
              );
            }
          }),
        ),
        'available': DefaultTabController(
          length: 3, // Number of tabs
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
                text: "Your E-Waste Listings",
                fontSize: FontSizes.mediumLargeTextSize(context),
                textStyle: MerriweatherTextStyle.appTextStyleRegular,
              ),
              bottom: TabBar(
                overlayColor: WidgetStatePropertyAll(
                  Palette.kPrimaryLightColor,
                ),
                splashBorderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                indicatorColor: Palette.kPrimaryDarkColor,
                tabs: [
                  Tab(
                    child: BuildText(
                      text: "Available",
                      fontSize: FontSizes.mediumTextSize(context),
                      textStyle: LoraTextStyle.appTextStyleRegular,
                    ),
                  ),
                  Tab(
                    child: BuildText(
                      text: "Reserved",
                      fontSize: FontSizes.mediumTextSize(context),
                      textStyle: LoraTextStyle.appTextStyleRegular,
                    ),
                  ),
                  Tab(
                    child: BuildText(
                      text: "Expired",
                      fontSize: FontSizes.mediumTextSize(context),
                      textStyle: LoraTextStyle.appTextStyleRegular,
                    ),
                  ),
                ],
              ),
            ),
            body: Obx(() {
              return Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: TabBarView(
                  children: [
                    /// Available Listings Tab
                    myEwasteListingsController.availableListings.isEmpty
                        ? Center(child: Text("No Available Listings"))
                        : ListView.builder(
                          itemCount:
                              myEwasteListingsController
                                  .availableListings
                                  .length,
                          itemBuilder: (context, index) {
                            final item =
                                myEwasteListingsController
                                    .availableListings[index];
                            return ProductListingCard(
                              listing: item,
                              type: 'available',
                            );
                          },
                        ),

                    /// Claimed Listings Tab
                    myEwasteListingsController.reservedListings.isEmpty
                        ? Center(child: Text("No Reserved Listings"))
                        : ListView.builder(
                          itemCount:
                              myEwasteListingsController
                                  .reservedListings
                                  .length,
                          itemBuilder: (context, index) {
                            final item =
                                myEwasteListingsController
                                    .reservedListings[index];
                            return ProductListingCard(
                              listing: item,
                              type: 'available',
                            );
                          },
                        ),
                    myEwasteListingsController.expiredListings.isEmpty
                        ? Center(child: Text("No Expired Listings"))
                        : ListView.builder(
                          itemCount:
                              myEwasteListingsController.expiredListings.length,
                          itemBuilder: (context, index) {
                            final item =
                                myEwasteListingsController
                                    .expiredListings[index];
                            return ProductListingCard(
                              listing: item,
                              type: 'available',
                            );
                          },
                        ),
                  ],
                ),
              );
            }),
          ),
        ),
      },
      defaultWidget: DefaultTabController(
        length: 3, // Number of tabs
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
              text: "Your E-Waste Listings",
              fontSize: FontSizes.mediumLargeTextSize(context),
              textStyle: MerriweatherTextStyle.appTextStyleRegular,
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: BuildText(
                    text: "Available",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleRegular,
                  ),
                ),
                Tab(
                  child: BuildText(
                    text: "Reserved",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleRegular,
                  ),
                ),
                Tab(
                  child: BuildText(
                    text: "Expired",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleRegular,
                  ),
                ),
              ],
            ),
          ),
          body: Obx(() {
            return TabBarView(
              children: [
                myEwasteListingsController.availableListings.isEmpty
                    ? Center(child: Text("No Available Listings"))
                    : ListView.builder(
                      itemCount:
                          myEwasteListingsController.availableListings.length,
                      itemBuilder: (context, index) {
                        final item =
                            myEwasteListingsController.availableListings[index];
                        return ProductListingCard(
                          listing: item,
                          type: 'available',
                        );
                      },
                    ),

                /// Claimed Listings Tab
                myEwasteListingsController.reservedListings.isEmpty
                    ? Center(child: Text("No Reserved Listings"))
                    : ListView.builder(
                      itemCount:
                          myEwasteListingsController.reservedListings.length,
                      itemBuilder: (context, index) {
                        final item =
                            myEwasteListingsController.reservedListings[index];
                        return ProductListingCard(
                          listing: item,
                          type: 'available',
                        );
                      },
                    ),
                myEwasteListingsController.expiredListings.isEmpty
                    ? Center(child: Text("No Expired Listings"))
                    : ListView.builder(
                      itemCount:
                          myEwasteListingsController.expiredListings.length,
                      itemBuilder: (context, index) {
                        final item =
                            myEwasteListingsController.expiredListings[index];
                        return ProductListingCard(
                          listing: item,
                          type: 'available',
                        );
                      },
                    ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
