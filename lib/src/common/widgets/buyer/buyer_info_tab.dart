import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:rebyte/src/common/helper/app_logger.dart';
import 'package:rebyte/src/common/widgets/custom_text.dart';
import 'package:rebyte/src/domain/association/models/ewaste_listing.dart';

import '../../../utils/palette.dart';
import '../../../utils/text_size.dart';
import '../../../utils/text_styles.dart';

class BuyerInfoTab extends StatelessWidget {
  final EWasteListing listing;

  const BuyerInfoTab({super.key, required this.listing});

  @override
  Widget build(BuildContext context) {
    Request request = listing.requests.firstWhere((element) {
      return element.status == 'approved' &&
          element.organizationId == listing.requestedBy;
    });
    AppLogger.customLog(request.priceOffered.toString());
    return Column(
      spacing: 10.h,
      children: [
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: Palette.kPrimaryNeutralColor,
              borderRadius: BorderRadius.circular(16.sp),
              border: Border.all(color: Palette.kPrimaryDarkColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.r,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRichText(
                  "Organization ID: ",
                  request.organizationId,
                  context,
                ),
                _buildRichText("Status: ", request.status, context),
                if (request.priceOffered != null)
                  _buildRichText(
                    "Price Accepted",
                    "₹${request.priceOffered!.toStringAsFixed(2)}",
                    context,
                  ),
                _buildRichText(
                  "Pickup Slot: ",
                  _formatDate(request.pickupSlot),
                  context,
                ),
                _buildRichText(
                  "Requested At: ",
                  _formatDate(request.requestedAt),
                  context,
                ),
              ],
            ),
          ),
        ),
        BuildText(
          text: "Transactions Detail",
          fontSize: FontSizes.mediumLargeTextSize(context),
          textStyle: SpaceTextStyle.appTextStyleBold,
        ),
      ],
    );
  }
}

Widget _buildRichText(String title, String value, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      BuildText(
        text: title,
        fontSize: FontSizes.mediumSmallTextSize(context),
        textStyle: LoraTextStyle.appTextStyleBold,
      ),
      BuildText(
        text: value.capitalizeFirst!,
        fontSize: FontSizes.mediumSmallTextSize(context),
        textStyle: LoraTextStyle.appTextStyleRegular,
      ),
    ],
  );
}

String _formatDate(DateTime date) {
  return DateFormat('MMM d, yyyy').format(date);
}
