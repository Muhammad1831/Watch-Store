import 'package:dio/dio.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/models/product_details_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class InterFaceProductDetailsDataSource {
  Future<ProductDetailsModel> getProductDetails(int id);
}

class ProductDetailsDataSource implements InterFaceProductDetailsDataSource {
  Dio httpsClient;
  ProductDetailsDataSource({required this.httpsClient});

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    final ProductDetailsModel productDetailsModel;

    try {
      var response =
          await httpsClient.get(AppApi.productDetails + id.toString());
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);

      productDetailsModel =
          ProductDetailsModel.fromJson(response.data['data'][0]);

      return productDetailsModel;
    } catch (e) {
      rethrow;
    }
  }
}
