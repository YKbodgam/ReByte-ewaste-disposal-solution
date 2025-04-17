import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rebyte/src/config/snackbar.dart';

import '../../common/helper/app_logger.dart';
import '../../common/helper/get_token.dart';

import '../token_constant/api_constant.dart';

class EWasteService {
  static final String baseUrl = "${ApiConstants.tokenBaseUrl}/api/ewaste";

  static Future<Map<String, dynamic>> createListing(
    Map<String, dynamic> listingData,
  ) async {
    AppLogger.customLog("Creating listing with data: $listingData");
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/create"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(listingData),
      );

      final jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 201) {
        AppLogger.customLog(
          "Listing Created Successfully: ${jsonResponse['message']}",
        );
        return jsonResponse;
      } else {
        AppLogger.error("Failed to create listing: ${jsonResponse['message']}");
        throw jsonResponse["message"] ?? "Failed to create listing.";
      }
    } catch (error) {
      AppLogger.error("Error creating listing: $error");
      throw "Something went wrong: $error";
    }
  }

  static Future<List<dynamic>> fetchUserListings({
    int page = 1,
    int limit = 10,
    String? status,
    String? sort,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/my-listings');

      final body = jsonEncode({
        "page": page,
        "limit": limit,
        "status": status,
        "sort": sort,
      });

      final res = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return data['listings']; // Return raw list (List<dynamic>)
      } else {
        AppLogger.error("Failed to fetch listings: ${res.body}");
        throw Exception("Failed to fetch listings: ${res.statusCode}");
      }
    } catch (e) {
      AppLogger.error("Error in fetchUserListingsRaw: $e");
      rethrow;
    }
  }

  static Future<List<dynamic>> fetchAllListings({
    int page = 1,
    int limit = 10,
    String? sort,
    List<String>? category,
    double? minPrice,
    double? maxPrice,
    String? listingType,
    double? lat,
    double? long,
    double? radius,
    String? id,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/all-listings');

      final body = {
        "page": page,
        "limit": limit,
        if (sort != null) "sort": sort,
        if (category != null && category.isNotEmpty) "category": category,
        if (minPrice != null) "minPrice": minPrice,
        if (maxPrice != null) "maxPrice": maxPrice,
        if (listingType != null) "listingType": listingType,
        if (id != null) "id": id,
        if (lat != null && long != null && radius != null) ...{
          "lat": lat,
          "long": long,
          "radius": radius,
        },
      };

      final res = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        return data['listings'];
      } else {
        AppLogger.error("Failed to fetch all listings: ${res.body}");
        throw Exception("Failed to fetch listings: ${res.statusCode}");
      }
    } catch (e) {
      AppLogger.error("Error in fetchAllListings: $e");
      rethrow;
    }
  }

  static Future<void> approveOrRejectRequest({
    required String listingId,
    required String organizationId,
    required String action,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/$listingId/requests');

      final body = jsonEncode({
        "organizationId": organizationId,
        "action": action,
      });

      final res = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        AppLogger.customLog(
          "Request processed successfully: ${data['message']}",
        );
        SnackWidget.showSnackbar(
          Get.context!,
          data["message"],
          onPressed: () {},
        );
        AppLogger.customLog("Success: ${data['message']}");
      } else {
        AppLogger.error("Failed to process request: ${res.body}");
        throw Exception("Failed to process request: ${res.statusCode}");
      }
    } catch (e) {
      AppLogger.error("Error in approveOrRejectRequest: $e");
      rethrow;
    }
  }
}
