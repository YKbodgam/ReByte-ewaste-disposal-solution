class CreateListingRequest {
  final String title;
  final String description;
  final int quantity;
  final String units;
  final String category;
  final String listingType;
  final String locationName;
  final double latitude;
  final double longitude;
  final List<String>? images;
  final double? price;
  final String? customCategory;
  final DateTime? expiryDate;

  CreateListingRequest({
    required this.title,
    required this.description,
    required this.quantity,
    required this.units,
    required this.category,
    required this.listingType,
    required this.locationName,
    required this.latitude,
    required this.longitude,
    this.images,
    this.price,
    this.customCategory,
    this.expiryDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "quantity": quantity,
      "units": units,
      "category": category,
      "listingType": listingType,
      "locationName": locationName,
      "latitude": latitude,
      "longitude": longitude,
      if (price != null) "price": price,
      if (customCategory != null) "customCategory": customCategory,
      if (images != null) "images": images,
      if (expiryDate != null) "expiryDate": expiryDate!.toIso8601String(),
    };
  }
}
