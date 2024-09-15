import 'package:dio/dio.dart';
import 'package:watch_store/data/data_source/product_details_data_source.dart';
import 'package:watch_store/models/product_details_model.dart';

abstract class InterFaceProductDetailsRepository {
  Future<ProductDetailsModel> getProductDetails(int id);
}

class ProductDetailsRepository implements InterFaceProductDetailsRepository {
  final InterFaceProductDetailsDataSource interFaceProductDetailsDataSource;

  ProductDetailsRepository({required this.interFaceProductDetailsDataSource});

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    try {
      return await interFaceProductDetailsDataSource.getProductDetails(id);
    } catch (e) {
      rethrow;
    }
  }
}

final productDetailsRepository = ProductDetailsRepository(
    interFaceProductDetailsDataSource:
        ProductDetailsDataSource(httpsClient: Dio()));
