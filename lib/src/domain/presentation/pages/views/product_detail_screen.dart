import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rebyte/src/common/helper/app_logger.dart';
import 'package:rebyte/src/common/helper/match_widget_from_map.dart';
import 'package:rebyte/src/common/widgets/buyer/buyer_info_tab.dart';

import 'package:rebyte/src/common/widgets/custom_text.dart';
import 'package:rebyte/src/domain/presentation/controller/product_detail_controller.dart';
import 'package:rebyte/src/common/widgets/product_info_tab.dart';
import 'package:rebyte/src/common/widgets/seller/product_request_tab.dart';
import 'package:rebyte/src/utils/text_size.dart';
import 'package:rebyte/src/utils/text_styles.dart';
import '../../../../utils/palette.dart';
import '../../../association/models/ewaste_listing.dart';

class ProductDetailScreen extends StatelessWidget {
  final String type;
  final productDetailController = Get.put(ProductDetailController());
  final EWasteListing listing;

  ProductDetailScreen({super.key, required this.listing, required this.type});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: type == "available" ? 2 : 3,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryNeutralColor,
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
            text: "Product Detail",
            fontSize: FontSizes.mediumLargeTextSize(context),
            textStyle: MerriweatherTextStyle.appTextStyleRegular,
          ),

          bottom: TabBar(
            onTap: (value) {
              if (value == 1 && type == 'available') {
                productDetailController.startTutorialAnimation();
              } else if (value == 1 && type == 'claimed') {
                productDetailController.showTutorial.value = false;
              }
            },
            overlayColor: WidgetStatePropertyAll(Palette.kPrimaryLightColor),
            splashBorderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            indicatorColor: Palette.kPrimaryDarkColor,

            tabs: [
              Tab(
                child: BuildText(
                  text: "Basic Info",
                  fontSize: FontSizes.mediumTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleRegular,
                ),
              ),
              Tab(
                child: matchWidgetFromMap(
                  variable: type,
                  matchMap: {
                    'available': BuildText(
                      text: "Requests",
                      fontSize: FontSizes.mediumTextSize(context),
                      textStyle: LoraTextStyle.appTextStyleRegular,
                    ),
                    'claimed': BuildText(
                      text: "Buyer",
                      fontSize: FontSizes.mediumTextSize(context),
                      textStyle: LoraTextStyle.appTextStyleRegular,
                    ),
                  },
                  defaultWidget: BuildText(
                    text: "Requests",
                    fontSize: FontSizes.mediumTextSize(context),
                    textStyle: LoraTextStyle.appTextStyleRegular,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductInfoTab(listing: listing),
            matchWidgetFromMap(
              variable: type,
              matchMap: {
                'available': ProductRequestTab(
                  listing: listing,
                  controller: productDetailController,
                ),
                'claimed': BuyerInfoTab(listing: listing),
              },
              defaultWidget: ProductRequestTab(
                listing: listing,
                controller: productDetailController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
