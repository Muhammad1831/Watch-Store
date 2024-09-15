class BannerModel {
  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  BannerModel({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
