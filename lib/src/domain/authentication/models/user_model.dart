class UserModel {
  String userFullName;
  String userEmailID;
  String userPassword;
  String userRole;
  String? userProfile;

  UserModel({
    required this.userFullName,
    required this.userEmailID,
    required this.userPassword,
    this.userProfile,
    this.userRole = 'user',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': userFullName,
      'email': userEmailID,
      'password': userPassword,
      'role': userRole, // "User" by default
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userFullName: map['name'] ?? 'Unknown',
      userEmailID: map['email'] ?? 'Unknown',
      userPassword: map['User-Password'] ?? 'Unknown',
      userRole: map['role'],
      userProfile: map['User-Profile'] ?? '',
    );
  }
}
