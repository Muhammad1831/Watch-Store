import 'package:watch_store/models/banner_model.dart';
import 'package:watch_store/models/categories_model.dart';
import 'package:watch_store/models/product_model.dart';
import 'package:watch_store/models/sliders_model.dart';

class HomeModel {
  List<SlidersModel> slider;
  List<CategoriesModel> categories;
  List<ProductModel> amazingProducts;
  List<ProductModel> mostSellerProducts;
  List<ProductModel> newestProducts;
  BannerModel banner;

  HomeModel({
    required this.slider,
    required this.categories,
    required this.amazingProducts,
    required this.mostSellerProducts,
    required this.newestProducts,
    required this.banner,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      slider: (json['sliders'] as List)
          .map((element) => SlidersModel.fromJson(element))
          .toList(),
      categories: (json['categories'] as List)
          .map((element) => CategoriesModel.fromJson(element))
          .toList(),
      amazingProducts: (json['amazing_products'] as List)
          .map((element) => ProductModel.fromJson(element))
          .toList(), 
      mostSellerProducts: (json['most_seller_products'] as List)
          .map((element) => ProductModel.fromJson(element))
          .toList(),
      newestProducts: (json['newest_products'] as List)
          .map((element) => ProductModel.fromJson(element))
          .toList(),
      banner: BannerModel.fromJson(json['banner']),
    );
  }
}
