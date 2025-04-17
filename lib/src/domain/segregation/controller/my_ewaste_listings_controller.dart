import 'package:get/get.dart';

import '../../../common/helper/app_logger.dart';
import '../../../services/token_functions/ewaste_service.dart';

import '../../association/models/ewaste_listing.dart';

class MyEwasteListingsController extends GetxController {
  var availableListings = <EWasteListing>[].obs;
  var claimedListings = <EWasteListing>[].obs;
  var reservedListings = <EWasteListing>[].obs;
  var expiredListings = <EWasteListing>[].obs;
  var isLoading = true.obs;

  // allowedStatuses = ["available", "reserved", "claimed", "expired"];
  @override
  void onInit() async {
    await loadMyListings(page: 1, limit: 10, status: 'reserved');
    await loadMyListings(page: 1, limit: 10, status: 'available');
    await loadMyListings(page: 1, limit: 10, status: 'claimed');
    await loadMyListings(page: 1, limit: 10, status: 'expired');
    super.onInit();
  }

  Future<void> loadMyListings({
    int page = 1,
    int limit = 10,
    String? status,
    String? sort,
  }) async {
    try {
      isLoading.value = true;
      final rawList = await EWasteService.fetchUserListings(
        page: page,
        limit: limit,
        status: status,
        sort: sort,
      );

      if (status == 'available') {
        availableListings.value =
            rawList.map((e) => EWasteListing.fromJson(e)).toList();
        AppLogger.customLog(
          "Fetched ${availableListings.length} available listings: ${availableListings.map((e) => e.title).toList()}",
        );
      }
      if (status == 'reserved') {
        reservedListings.value =
            rawList.map((e) => EWasteListing.fromJson(e)).toList();
        AppLogger.customLog(
          "Fetched ${reservedListings.length} available listings: ${reservedListings.map((e) => e.title).toList()}",
        );
      }
      if (status == 'expired') {
        expiredListings.value =
            rawList.map((e) => EWasteListing.fromJson(e)).toList();
        AppLogger.customLog(
          "Fetched ${expiredListings.length} available listings: ${expiredListings.map((e) => e.title).toList()}",
        );
      }
      if (status == 'claimed') {
        claimedListings.value =
            rawList.map((e) => EWasteListing.fromJson(e)).toList();
        AppLogger.customLog(
          "Fetched ${claimedListings.length} claimed listings: ${claimedListings.map((e) => e.title).toList()}",
        );
      }
    } catch (e) {
      AppLogger.error("Controller error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}




// Status Info
// available status = 0 Request made on that Listing.
// reserved status = atleast one person has shown interest and requested it.
// claimed status = seller accepted the request and now no other person can request this listing.
// expired status = if user has set the expired dateTime