class OrganizationModel {
  String role;
  String userFullName;
  String organizationName;
  String organizationEmailID;
  String organizationPassword;
  String organizationAddress;

  OrganizationModel({
    required this.userFullName,
    required this.organizationName,
    required this.organizationEmailID,
    required this.organizationPassword,
    this.role = 'organization',
    required this.organizationAddress,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userFullName': userFullName,
      'organizationName': organizationName,
      'organizationEmailID': organizationEmailID,
      'organizationPassword': organizationPassword,
      'role': role,
      'organizationAddress': organizationAddress,
    };
  }

  factory OrganizationModel.fromMap(Map<String, dynamic> map) {
    return OrganizationModel(
      userFullName: map['userFullName'] as String,
      organizationName: map['organizationName'] as String,
      organizationEmailID: map['organizationEmailID'] as String,
      organizationPassword: map['organizationPassword'] as String,
      role: map['role'] as String,
      organizationAddress: map['organizationAddress'] as String,
    );
  }
}
