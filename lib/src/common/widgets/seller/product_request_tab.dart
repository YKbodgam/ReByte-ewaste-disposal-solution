import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rebyte/src/common/widgets/custom_text.dart';
import 'package:rebyte/src/domain/association/models/ewaste_listing.dart';
import 'package:rebyte/src/domain/presentation/controller/product_detail_controller.dart';
import 'package:rebyte/src/services/token_functions/ewaste_service.dart';
import 'package:rebyte/src/utils/text_size.dart';
import 'package:rebyte/src/utils/text_styles.dart';
import '../../../utils/palette.dart';

class ProductRequestTab extends StatelessWidget {
  final EWasteListing listing;
  final ProductDetailController controller;

  const ProductRequestTab({
    super.key,
    required this.listing,

    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        listing.requests.isEmpty
            ? Center(
              child: BuildText(
                text: "No requests yet.",
                fontSize: FontSizes.mediumTextSize(context),
                textStyle: LoraTextStyle.appTextStyleRegular,
                color: Palette.kTextSecondaryColor,
              ),
            )
            : ListView.builder(
              padding: EdgeInsets.all(16.r),
              itemCount: listing.requests.length,
              itemBuilder: (context, index) {
                final request = listing.requests[index];
                return Dismissible(
                  key: Key(
                    request.organizationId + request.requestedAt.toString(),
                  ),
                  direction: DismissDirection.horizontal,
                  background: _slideBackground(accept: true),
                  secondaryBackground: _slideBackground(accept: false),
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      await EWasteService.approveOrRejectRequest(
                        listingId: listing.id,
                        organizationId: request.organizationId,
                        action: "approve",
                      );
                    } else {
                      // Reject the request
                      await EWasteService.approveOrRejectRequest(
                        listingId: listing.id,
                        organizationId: request.organizationId,
                        action: "reject",
                      );
                    }
                  },
                  child: Obx(() {
                    return controller.showTutorial.value
                        ? SizedBox()
                        : _buildRequestCard(request, context);
                  }),
                );
              },
            ),

        Obx(() {
          if (!controller.showTutorial.value) return const SizedBox.shrink();

          return Positioned(
            top: 40.h,
            left: 16.w,
            right: 16.w,
            child: AnimatedSlide(
              offset: Offset(controller.slideOffset.value, 0),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Opacity(
                opacity: 0.95,
                child: Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.r,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildText(
                        text: "This is how you manage requests",
                        fontSize: FontSizes.mediumLargeTextSize(context),
                        textStyle: SpaceTextStyle.appTextStyleBold,
                      ),
                      SizedBox(height: 8.h),
                      BuildText(
                        text: "-> Swipe right to Accept ✅",
                        textStyle: LoraTextStyle.appTextStyleRegular,
                        fontSize: FontSizes.mediumSmallTextSize(context),
                      ),
                      SizedBox(height: 8.h),
                      BuildText(
                        text: "<- Swipe left to Reject ❌",
                        textStyle: LoraTextStyle.appTextStyleRegular,
                        fontSize: FontSizes.mediumSmallTextSize(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildRequestCard(Request request, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
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
          _buildRichText("Organization ID: ", request.organizationId, context),
          _buildRichText("Status: ", request.status, context),
          if (request.priceOffered != null)
            _buildRichText(
              "Price Offered: ",
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
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.swipe, size: 18.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              BuildText(
                text: "Swipe to Accept/Reject",
                fontSize: FontSizes.mediumSmallTextSize(context),
                textStyle: LoraTextStyle.appTextStyleRegular,
                color: Palette.kTextSecondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
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

  Widget _slideBackground({required bool accept}) {
    return Container(
      decoration: BoxDecoration(
        color: accept ? Colors.green.shade400 : Colors.red.shade400,
        borderRadius: BorderRadius.circular(25.r),
      ),
      alignment: accept ? Alignment.centerLeft : Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20.sp),

      child: Icon(
        accept ? Icons.check_circle : Icons.cancel,
        color: Colors.white,
        size: 28.sp,
      ),
    );
  }
}
