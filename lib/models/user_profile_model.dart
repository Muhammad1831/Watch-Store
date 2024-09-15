class UserProfileModel {
  UserInfo userInfo;
  int userProcessingCount;
  int userReceivedCount;
  int userCancelCount;

  UserProfileModel(
      {required this.userInfo,
      required this.userProcessingCount,
      required this.userReceivedCount,
      required this.userCancelCount});

  factory UserProfileModel.fromJson(dynamic json) {
    return UserProfileModel(
        userInfo: UserInfo.fromJson(json['user_info']),
        userProcessingCount: json['user_processing_count'],
        userReceivedCount: json['user_received_count'],
        userCancelCount: json['user_cancel_count']);
  }
}

class UserInfo {
  int id;
  String? name;
  String? mobile;
  String? phone;
  Address? address;

  UserInfo(
      {required this.id,
      required this.name,
      required this.mobile,
      required this.phone,
      required this.address});

  factory UserInfo.fromJson(dynamic json) {
    return UserInfo(
        id: json['id'],
        name: json['name'],
        mobile: json['mobile'],
        phone: json['phone'],
        address:
            json['address'] != null ? Address.fromJson(json['address']) : null);
  }
}

class Address {
  String address;
  double lat;
  double lng;
  String postalCode;

  Address(
      {required this.address,
      required this.lat,
      required this.lng,
      required this.postalCode});

  factory Address.fromJson(dynamic json) {
    return Address(
        address: json['address'],
        lat: json['lat'],
        lng: json['lng'],
        postalCode: json['postal_code']);
  }
}
