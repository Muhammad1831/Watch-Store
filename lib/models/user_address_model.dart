class UserAddressModel {
  int id;
  String adderss;
  int postalCode;
  double lat;
  double lng;
  int userId;
  String createdAt;
  String updatedAt;  

  UserAddressModel(
      {required this.id,
      required this.adderss,
      required this.postalCode,
      required this.lat,
      required this.lng,
      required this.userId,
      required this.createdAt,
      required this.updatedAt});

  factory UserAddressModel.fromJson(dynamic json) {
    return UserAddressModel( 
        id: json['id'],
        adderss: json['adderss'],
        postalCode: json['postal_code'],
        lat: json['lat'],
        lng: json['lng'],
        userId: json['user_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
