class UserModel {
  String userFullName;
  String userEmailID;
  String role;
  bool? isVerified;
  bool? isActive;
  int? coins;
  String? userProfile;
  String? organizationName;
  String? organizationAddress;
  double? averageRating;
  List<String>? reviews;
  String? userPassword;

  UserModel({
    this.userPassword,
    required this.userFullName,
    required this.userEmailID,
    required this.role,
    this.isVerified,
    this.isActive,
    this.coins,
    this.userProfile,
    this.organizationName,
    this.organizationAddress,
    this.averageRating,
    this.reviews,
  });

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': userFullName,
      'email': userEmailID,
      'role': role,
      'isVerified': isVerified,
      'isActive': isActive,
      'password': userPassword,
      if (coins != null) 'coins': coins,
      if (userProfile != null) 'profile': userProfile,
      if (organizationName != null) 'organizationName': organizationName,
      if (organizationAddress != null)
        'organizationAddress': organizationAddress,
      if (averageRating != null) 'averageRating': averageRating,
      if (reviews != null) 'reviews': reviews,
    };
  }

  /// Factory constructor to create an instance from a Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userFullName: map['name'] ?? '',
      userEmailID: map['email'] ?? '',
      role: map['role'] ?? 'user',
      isVerified: map['isVerified'] ?? false,
      isActive: map['isActive'] ?? true,
      coins: map['coins'],
      userProfile: map['profile'],
      organizationName: map['organizationName'],
      organizationAddress: map['organizationAddress'],
      averageRating: map['averageRating']?.toDouble(),
      reviews:
          map['reviews'] != null ? List<String>.from(map['reviews']) : null,
    );
  }
}
