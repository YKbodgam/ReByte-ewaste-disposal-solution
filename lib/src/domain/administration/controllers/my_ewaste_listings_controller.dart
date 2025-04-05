import 'package:get/get.dart';

import '../../../common/helper/app_logger.dart';
import '../../../services/token_functions/ewaste_service.dart';

import '../../association/models/ewaste_listing.dart';

class MyEwasteListingsController extends GetxController {
  var listings = <EWasteListing>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    await loadMyListings(page: 1, limit: 10);
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
      listings.value = rawList.map((e) => EWasteListing.fromJson(e)).toList();

      AppLogger.customLog(
        "Fetched ${listings.length} listings: ${listings.map((e) => e.title).toList()}",
      );
    } catch (e) {
      AppLogger.error("Controller error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
