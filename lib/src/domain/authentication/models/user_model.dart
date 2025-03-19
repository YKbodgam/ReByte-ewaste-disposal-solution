class UserModel {
  String userFullName;
  String userEmailID;
  String userPassword;
  String role;
  String? userProfile;

  UserModel({
    required this.userFullName,
    required this.userEmailID,
    required this.userPassword,
    this.userProfile,
    this.role = 'user',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': userFullName,
      'email': userEmailID,
      'password': userPassword,
      'role': role, // "User" by default
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userFullName: map['name'] ?? 'Unknown',
      userEmailID: map['email'] ?? 'Unknown',
      userPassword: map['password'] ?? 'Unknown',
      role: map['role'],
      userProfile: map['profile'] ?? '',
    );
  }
}
