import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/models/brands_model.dart';
import 'package:watch_store/models/product_model.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class InterFaceProductDataSource {
  Future<List<BrandsModel>> getBrands();
  Future<List<ProductModel>> searchProduct(String searchKey);
  Future<List<ProductModel>> getProductsByCategory(int id);
  Future<List<ProductModel>> getProductsByBrand(int id);
  Future<List<ProductModel>> getProductsSortBy(String sortBy);
}

class ProductRemoteDataSource implements InterFaceProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource({required this.httpClient});

  @override
  Future<List<BrandsModel>> getBrands() async {
    List<BrandsModel> brandsModel = <BrandsModel>[];

    try {
      var response = await httpClient.get(AppApi.brands);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode);
      for (var element in response.data['all_brands']) {
        brandsModel.add(BrandsModel.fromJson(element));
      }
      return brandsModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getProductsByBrand(int id) async {
    List<ProductModel> products = <ProductModel>[];

    try {
      var response =
          await httpClient.get(AppApi.productsByBrand + id.toString());

      debugPrint(response.data.toString());

      ResponseValidator.validateStatusCode(
          statusCode: response.statusCode ?? 0);
      response.data['products_by_brands']['data'].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      return products;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int id) async {
    List<ProductModel> products = <ProductModel>[];

    try {
      var response =
          await httpClient.get(AppApi.productsByCategory + id.toString());

      ResponseValidator.validateStatusCode(
          statusCode: response.statusCode ?? 0);
      response.data['products_by_category']['data'].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      return products;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getProductsSortBy(String sortBy) async {
    List<ProductModel> products = <ProductModel>[];

    try {
      var response = await httpClient.get(AppApi.baseUrl + sortBy);

      debugPrint(response.data.toString());

      ResponseValidator.validateStatusCode(
          statusCode: response.statusCode ?? 0);
      response.data['all_products']['data'].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      return products;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> searchProduct(String searchKey) async {
    List<ProductModel> products = <ProductModel>[];

    try {
      var response = await httpClient.get(AppApi.search + searchKey);

      debugPrint(response.data.toString());

      ResponseValidator.validateStatusCode(
          statusCode: response.statusCode ?? 0);
      response.data['all_products']['data'].forEach((element) {
        products.add(ProductModel.fromJson(element));
      });
      return products;
    } catch (e) {
      rethrow;
    }
  }
}
