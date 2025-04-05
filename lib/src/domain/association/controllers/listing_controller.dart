import 'dart:io';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/snackbar.dart';
import '../../../common/helper/app_logger.dart';
import '../../../common/services/location_service.dart';
import '../../../services/token_functions/ewaste_service.dart';

import '../models/ewaste_listing.dart';
import '../models/create_listing_request.dart';

class CreateListingController extends GetxController {
  var isLoading = false.obs;

  // Image Upload
  var images = <File>[].obs;

  // Basic Details
  var title = TextEditingController();
  var description = TextEditingController();
  var quantity = TextEditingController();
  var units = "kg".obs;
  var category = "Mobile".obs;
  var customCategory = TextEditingController();

  // Pickup Location
  var locationName = "".obs;
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  var zipCodeController = TextEditingController();
  var latitude = TextEditingController();
  var longitude = TextEditingController();

  // Price and Expiry
  var listingType = "donation".obs;
  var price = TextEditingController();

  void clearTextFeilds() {
    title.clear();
    description.clear();
    quantity.clear();
    units.value = "kg";
    category.value = "Mobile";
    customCategory.clear();
    locationName.value = "";
    addressController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
    zipCodeController.clear();
    latitude.clear();
    longitude.clear();
    images.clear();
    listingType.value = "donation";
    price.clear();
  }

  // Main Function to create listing
  Future<void> createListing() async {
    try {
      isLoading.value = true;
      concatinateLocation();
      final listingData = CreateListingRequest(
        title: title.text,
        description: description.text,
        quantity: int.parse(quantity.text),
        units: units.value,
        category: category.value,
        listingType: listingType.value,
        locationName: locationName.value,
        latitude: double.parse(latitude.text),
        longitude: double.parse(longitude.text),
        images: images.map((e) => e.path).toList(),
        price: price.text.isNotEmpty ? double.parse(price.text) : null,
        customCategory:
            customCategory.text.isNotEmpty ? customCategory.text : null,
      );
      AppLogger.customLog(listingData.toJson().toString());

      Map<String, dynamic> response = await EWasteService.createListing(
        listingData.toJson(),
      );

      EWasteListing newListing = EWasteListing.fromJson(response["listing"]);
      AppLogger.customLog(newListing.toString());

      SnackWidget.showSnackbar(Get.context!, "Listing created successfully!");
      clearTextFeilds();
    } catch (error) {
      AppLogger.error("Error In Controller $error");
      SnackWidget.showSnackbar(Get.context!, error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Helper Functions In Ewaste Listing Creations
  void pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      images.addAll(pickedFiles.map((e) => File(e.path)));
    }
  }

  void concatinateLocation() {
    locationName.value =
        "${addressController.text}, ${cityController.text}, ${stateController.text}, ${countryController.text}, ${zipCodeController.text}";
  }

  void getCurrentLocation() {
    isLoading.value = true;
    LocationService.getCurrentLocation().then((value) {
      latitude.text = value.latitude.toString();
      longitude.text = value.longitude.toString();
      getCurrentAddress(value);
    });
  }

  void getCurrentAddress(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      var placemark = placemarks.firstWhere(
        (p) => p.postalCode != null && p.locality != null,
        orElse: () => placemarks.first,
      );

      stateController.text = placemark.administrativeArea ?? 'Not Available';
      countryController.text = placemark.country ?? 'Unknown';
      zipCodeController.text = placemark.postalCode ?? 'Not Available';
      cityController.text = placemark.locality ?? 'Not Available';
    } catch (e) {
      log("Error in geocoding: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
