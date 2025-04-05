class EWasteListing {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final String units;
  final double? price;
  final String category;
  final String? customCategory;
  final String listingType;
  final Location location;
  final List<String> images;
  final String user;
  final String status;
  final DateTime? expiryDate;
  final String? requestedBy;
  final List<Request> requests;
  final DateTime createdAt;
  final DateTime updatedAt;

  EWasteListing({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.units,
    this.price,
    required this.category,
    this.customCategory,
    required this.listingType,
    required this.location,
    required this.images,
    required this.user,
    required this.status,
    this.expiryDate,
    this.requestedBy,
    required this.requests,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EWasteListing.fromJson(Map<String, dynamic> json) {
    return EWasteListing(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      quantity: json["quantity"],
      units: json["units"],
      price: json["price"]?.toDouble(),
      category: json["category"],
      customCategory: json["customCategory"],
      listingType: json["listingType"],
      location: Location.fromJson(json["location"]),
      images: List<String>.from(json["images"] ?? []),
      user: json["user"],
      status: json["status"],
      expiryDate:
          json["expiryDate"] != null
              ? DateTime.parse(json["expiryDate"])
              : null,
      requestedBy: json["requestedBy"],
      requests:
          (json["requests"] as List?)
              ?.map((req) => Request.fromJson(req))
              .toList() ??
          [],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }

  //
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "description": description,
      "quantity": quantity,
      "units": units,
      "price": price,
      "category": category,
      "customCategory": customCategory,
      "listingType": listingType,
      "location": location.toJson(),
      "images": images,
      "user": user,
      "status": status,
      "expiryDate": expiryDate?.toIso8601String(),
      "requestedBy": requestedBy,
      "requests": requests.map((req) => req.toJson()).toList(),
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}

class Location {
  String type;
  List<double> coordinates;
  String name;

  Location({required this.type, required this.coordinates, required this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"],
      coordinates: List<double>.from(
        json["coordinates"].map((x) => x.toDouble()),
      ),
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"type": type, "coordinates": coordinates, "name": name};
  }
}

class Request {
  String organizationId;
  String status;
  double? priceOffered;
  DateTime pickupSlot;
  DateTime requestedAt;

  Request({
    required this.organizationId,
    required this.status,
    this.priceOffered,
    required this.pickupSlot,
    required this.requestedAt,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      organizationId: json["organizationId"],
      status: json["status"],
      priceOffered: json["priceOffered"]?.toDouble(),
      pickupSlot: DateTime.parse(json["pickupSlot"]),
      requestedAt: DateTime.parse(json["requestedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "organizationId": organizationId,
      "status": status,
      "priceOffered": priceOffered,
      "pickupSlot": pickupSlot.toIso8601String(),
      "requestedAt": requestedAt.toIso8601String(),
    };
  }
}
