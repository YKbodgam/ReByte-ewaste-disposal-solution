import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:rebyte/src/common/widgets/custom_text.dart';
import 'package:rebyte/src/domain/association/models/ewaste_listing.dart';
import 'package:rebyte/src/utils/palette.dart';
import 'package:rebyte/src/utils/text_size.dart';
import 'package:rebyte/src/utils/text_styles.dart';

class ProductInfoTab extends StatelessWidget {
  final EWasteListing listing;
  const ProductInfoTab({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (listing.images.isNotEmpty)
            SizedBox(
              height: 200.h,
              child: PageView.builder(
                itemCount: listing.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.shutterstock.com/image-photo/kiel-germany-november-22-2018-260nw-1511680658.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          SizedBox(height: 16.h),
          BuildText(
            color: Palette.kPrimaryDarkColor,
            textStyle: LoraTextStyle.appTextStyleBold,
            text: listing.title,
            fontSize: FontSizes.largeTextSize(context),
          ),
          SizedBox(height: 8.h),
          BuildText(
            alignment: TextAlign.justify,
            maxLines: 10,
            color: Palette.kTextSecondaryColor,
            textStyle: MerriweatherTextStyle.appTextStyleRegular,
            text: listing.description,
            fontSize: FontSizes.mediumSmallTextSize(context),
          ),

          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Palette.kPrimaryBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BuildText(
                  text: listing.status.toUpperCase(),
                  fontSize: FontSizes.mediumSmallTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleBold,
                  alignment: TextAlign.start,
                  color: Palette.kBorderPrimaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Palette.kPrimaryBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BuildText(
                  text: 'Requests : ${listing.requests.length.toString()}',
                  fontSize: FontSizes.mediumSmallTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleBold,
                  alignment: TextAlign.start,
                  color: Palette.kBorderPrimaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Palette.kPrimaryBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: BuildText(
                  text: listing.listingType.toUpperCase(),
                  fontSize: FontSizes.mediumSmallTextSize(context),
                  textStyle: LoraTextStyle.appTextStyleBold,
                  alignment: TextAlign.start,
                  color: Palette.kBorderPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          BuildText(
            text: "Product Details",
            color: Palette.kPrimaryDarkColor,
            textStyle: LoraTextStyle.appTextStyleBold,
            fontSize: FontSizes.mediumLargeTextSize(context),
          ),
          SizedBox(height: 12.h),

          // Grey container for details
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: Palette.kDisabledButtonColor.withAlpha(
                100,
              ), // you can define this or use a light grey like Colors.grey[200]
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow(
                  "Quantity",
                  "${listing.quantity} ${listing.units}",
                  context,
                ),
                _buildDetailRow(
                  "Category",
                  listing.customCategory ?? listing.category,
                  context,
                ),
                _buildDetailRow("Type", listing.listingType, context),
                _buildDetailRow(
                  "Location",
                  listing.location.name.split(',')[0],
                  context,
                ),
                _buildDetailRow("Status", listing.status, context),
                _buildDetailRow(
                  "Expiry Date",
                  listing.expiryDate != null
                      ? _formatDate(listing.expiryDate!)
                      : "No Expiry",
                  context,
                ),
                _buildDetailRow(
                  "Created At",
                  _formatDate(listing.createdAt),
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDetailRow(String label, String value, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildText(
          color: Palette.kSecondaryNeutralColor,
          textStyle: MerriweatherTextStyle.appTextStyleRegular,
          text: label,
          fontSize: FontSizes.mediumSmallTextSize(context),
        ),
        BuildText(
          color: Palette.kTextSecondaryColor,
          textStyle: MerriweatherTextStyle.appTextStyleRegular,
          text: value.capitalizeFirst ?? value,
          fontSize: FontSizes.mediumSmallTextSize(context),
        ),
      ],
    ),
  );
}

String _formatDate(DateTime date) {
  return DateFormat('MMM d, yyyy').format(date);
}
