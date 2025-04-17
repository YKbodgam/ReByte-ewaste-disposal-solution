import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rebyte/src/common/widgets/custom_text.dart';
import 'package:rebyte/src/domain/association/models/ewaste_listing.dart';
import 'package:rebyte/src/domain/presentation/pages/views/product_detail_screen.dart';
import 'package:rebyte/src/utils/palette.dart';
import 'package:rebyte/src/utils/text_size.dart';
import 'package:rebyte/src/utils/text_styles.dart';

class ProductListingCard extends StatelessWidget {
  final String type;
  final EWasteListing listing;

  const ProductListingCard({
    super.key,
    required this.listing,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product detail screen
        Get.to(() => ProductDetailScreen(listing: listing, type: type));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Palette.kPrimaryNeutralColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Palette.kPrimaryLightAccent.withAlpha(100)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child:
              // false
              //     ? Image.network(
              //       listing.images[0],
              //       height: 90,
              //       width: 90,
              //       fit: BoxFit.cover,
              //     )
              Container(
                height: 90.h,
                width: 90.h,
                color: Palette.kPrimaryLightColor.withAlpha(150),
                child: Icon(Icons.image_not_supported, size: 40.sp),
              ),
            ),
            SizedBox(width: 16.w),

            // Listing details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  BuildText(
                    text: listing.title,
                    fontSize: FontSizes.mediumLargeTextSize(context),
                    textStyle: SpaceTextStyle.appTextStyleBold,
                  ),

                  SizedBox(height: 6.h),

                  // Category & Quantity
                  Row(
                    children: [
                      Icon(
                        Icons.category,
                        color: Palette.kTextSecondaryColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      BuildText(
                        text: listing.category,
                        fontSize: FontSizes.mediumTextSize(context),
                        textStyle: SpaceTextStyle.appTextStyleMedium,
                        color: Palette.kTextSecondaryColor,
                      ),
                      SizedBox(width: 12.w),
                      Icon(
                        Icons.scale,
                        color: Palette.kTextSecondaryColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.w),
                      BuildText(
                        text: "${listing.quantity} ${listing.units}",
                        fontSize: FontSizes.mediumTextSize(context),
                        textStyle: SpaceTextStyle.appTextStyleMedium,
                        color: Palette.kTextSecondaryColor,
                      ),
                    ],
                  ),

                  SizedBox(height: 6.h),

                  // Location & Date
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        color: Palette.kTextSecondaryColor,
                        size: 16.sp,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: BuildText(
                          text: listing.requests.length.toString(),
                          fontSize: FontSizes.mediumSmallTextSize(context),
                          textStyle: SpaceTextStyle.appTextStyleMedium,
                          alignment: TextAlign.start,
                          color: Palette.kTextSecondaryColor,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      BuildText(
                        text: DateFormat('dd MMM').format(listing.createdAt),
                        fontSize: FontSizes.mediumSmallTextSize(context),
                        textStyle: SpaceTextStyle.appTextStyleMedium,
                        alignment: TextAlign.start,
                        color: Palette.kTextSecondaryColor,
                      ),
                    ],
                  ),

                  SizedBox(height: 6.h),

                  // Price & Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.kSecondaryLightAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: BuildText(
                          text: listing.status.toUpperCase(),
                          fontSize: FontSizes.mediumSmallTextSize(context),
                          textStyle: LoraTextStyle.appTextStyleBold,
                          alignment: TextAlign.start,
                          color: Palette.kSecondaryDarkColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.kSecondaryLightAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: BuildText(
                          text: listing.listingType.toUpperCase(),
                          fontSize: FontSizes.mediumSmallTextSize(context),
                          textStyle: LoraTextStyle.appTextStyleBold,
                          alignment: TextAlign.start,
                          color: Palette.kSecondaryDarkColor,
                        ),
                      ),
                    ],
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
