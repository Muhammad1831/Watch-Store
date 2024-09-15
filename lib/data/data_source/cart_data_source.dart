import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/models/cart_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class InterFaceCartDataSource {
  Future<CartModel> getUserCart();
  Future<CartModel> addToCart({required int? productId});
  Future<CartModel> removeFromCart({required int? productId});
  Future<CartModel> deleteFromCart({required int? productId});
  Future<int> countBasketProduct();
  Future<String> payment();
}

class CartRemoteDataSource implements InterFaceCartDataSource {
  Dio httpClient;

  CartRemoteDataSource({required this.httpClient});

  @override
  Future<CartModel> getUserCart() async {
    final CartModel cartModel;
    try {
      var response = await httpClient.post(AppApi.userCart);
      ResponseValidator.validateStatusCode(
          statusCode: response.statusCode ?? 0);
      cartModel = CartModel.fromJosn(response.data['data']);
      debugPrint(cartModel.toString());
      return cartModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CartModel> addToCart({required int? productId}) async {
    final CartModel cartModel;
    try {
      var response = await httpClient
          .post(AppApi.addToCart, data: {'product_id': productId});
      cartModel = CartModel.fromJosn(response.data['data']);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      return cartModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CartModel> deleteFromCart({required int? productId}) async {
    final CartModel cartModel;
    try {
      var response = await httpClient
          .post(AppApi.deleteFromCart, data: {'product_id': productId});
      cartModel = CartModel.fromJosn(response.data['data']);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      return cartModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CartModel> removeFromCart({required int? productId}) async {
    final CartModel cartModel;
    try {
      var response = await httpClient
          .post(AppApi.removeFromCart, data: {'product_id': productId});
      cartModel = CartModel.fromJosn(response.data['data']);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      return cartModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> countBasketProduct() async {
    var response = await httpClient.post(AppApi.userCart);
    ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }

  @override
  Future<String> payment() async {
    var response = await httpClient.post(AppApi.payment);
    ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
    debugPrint(response.data['action']);
    return response.data['action'];
  }
}
