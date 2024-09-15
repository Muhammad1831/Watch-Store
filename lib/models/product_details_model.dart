class ProductDetailsModel {
  int? id;
  String? title;
  String? titleEn;
  int? price;
  int? discount;
  int? discountPrice;
  String? guaranty;
  int? productCount;
  String? category;
  int? categoryId;
  List<ColorsModel>? colors;
  String? brand;
  int? brandId;
  int? review;
  String? image;
  List<PropertiesModel>? properties;
  String? description;
  String? discussion;
  List<CommentsModel>? comments;

  ProductDetailsModel(
      {required this.id,
      required this.title,
      required this.titleEn,
      required this.price,
      required this.discount,
      required this.discountPrice,
      required this.guaranty,
      required this.productCount,
      required this.category,
      required this.categoryId,
      required this.colors,
      required this.brand,
      required this.brandId,
      required this.review,
      required this.image,
      required this.properties,
      required this.description,
      required this.discussion,
      required this.comments});

  factory ProductDetailsModel.fromJson(dynamic json) {
    return ProductDetailsModel(
        id: json['id'],
        title: json['title'],
        titleEn: json['title_en'],
        price: json['price'],
        discount: json['discount'],
        discountPrice: json['discount_price'],
        guaranty: json['guaranty'],
        productCount: json['product_count'],
        category: json['category'],
        categoryId: json['category_id'],
        colors: (json['colors'] as List)
            .map((e) => ColorsModel.fromJson(e))
            .toList(),
        brand: json['brand'],
        brandId: json['brand_id'],
        review: json['review'],
        image: json['image'],
        properties: (json['properties'] as List)
            .map((e) => PropertiesModel.fromJson(e))
            .toList(),
        description: json['description'],
        discussion: json['discussion'],
        comments: (json['comments'] as List)
            .map((e) => CommentsModel.fromJson(e))
            .toList());
  }
}

class ColorsModel {
  String title;
  String code;

  ColorsModel({required this.title, required this.code});

  factory ColorsModel.fromJson(dynamic json) {
    return ColorsModel(title: json['title'], code: json['code']);
  }
}

class PropertiesModel {
  String property;
  String value;

  PropertiesModel({required this.property, required this.value});

  factory PropertiesModel.fromJson(dynamic json) {
    return PropertiesModel(property: json['property'], value: json['value']);
  }
}

class CommentsModel {
  String user;
  String body;

  CommentsModel({required this.user, required this.body});

  factory CommentsModel.fromJson(dynamic json) {
    return CommentsModel(user: json['user'], body: json['body']);
  }
}
