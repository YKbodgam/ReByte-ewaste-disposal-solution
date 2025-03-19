class OrganizationModel {
  String role;
  String userFullName;
  String userEmailID;
  String userPassword;
  String organizationName;
  String organizationAddress;

  OrganizationModel({
    required this.userFullName,
    required this.organizationName,
    required this.userEmailID,
    required this.userPassword,
    this.role = 'organization',
    required this.organizationAddress,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': userFullName,
      'email': userEmailID,
      'password': userPassword,
      'role': role,
      'organizationName': organizationName,
      'organizationAddress': organizationAddress,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      userFullName: map['name'] ?? '',
      organizationName: map['organizationName'] ?? '',
      userEmailID: map['email'] ?? '',
      userPassword: map['password'] ?? '',
      role: map['role'] ?? '',
      organizationAddress: map['organizationAddress'] ?? '',
    );
  }
}
