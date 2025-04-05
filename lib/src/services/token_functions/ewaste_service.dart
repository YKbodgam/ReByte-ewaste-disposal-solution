import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
