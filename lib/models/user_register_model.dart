class UserRegister {
  final dynamic image;
  final String phone;
  final String name;
  final String address;
  final String postalCode;
  final double lat;
  final double lng;

  UserRegister({
    required this.image,
    required this.phone,
    required this.name,
    required this.address,
    required this.postalCode,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'phone': phone,
      'address': address,
      'postal_code': postalCode,
      'lat': lat,
      'lng': lng,
    };
  }
}
