class SlidersModel {
  int id;
  String title;
  String image;

  SlidersModel({required this.id, required this.title, required this.image});

  factory SlidersModel.fromJson(Map<String, dynamic> json) {
    return SlidersModel(
        id: json['id'], title: json['title'], image: json['image']);
  }
}
