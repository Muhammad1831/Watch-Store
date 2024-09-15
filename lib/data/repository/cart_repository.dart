import 'package:flutter/material.dart';
import 'package:watch_store/data/config/config.dart';
import 'package:watch_store/data/data_source/cart_data_source.dart';
import 'package:watch_store/models/cart_model.dart';

abstract class InterFaceCartRepository {
  Future<CartModel> getUserCart();
  Future<CartModel> addToCart({required int? productId});
  Future<CartModel> removeFromCart({required int? productId});
  Future<CartModel> deleteFromCart({required int? productId});
  Future<int> countBasketProduct();
  Future<String> payment();
}

class CartRepository implements InterFaceCartRepository {
  final InterFaceCartDataSource interFaceCartDataSource;
  ValueNotifier<int> countBasketProducts = ValueNotifier(0);

  CartRepository({required this.interFaceCartDataSource});
  @override
  Future<CartModel> getUserCart() async {
    return await interFaceCartDataSource.getUserCart();
  }

  @override
  Future<CartModel> addToCart({required int? productId}) async {
    return await interFaceCartDataSource
        .addToCart(productId: productId)
        .then((value) {
      countBasketProducts.value = value.userCart.length;
      return value;
    });
  }

  @override
  Future<CartModel> deleteFromCart({required int? productId}) async {
    return await interFaceCartDataSource
        .deleteFromCart(productId: productId)
        .then((value) {
      countBasketProducts.value = value.userCart.length;
      return value;
    });
  }

  @override
  Future<CartModel> removeFromCart({required int? productId}) async {
    return await interFaceCartDataSource.removeFromCart(productId: productId);
  }

  @override
  Future<int> countBasketProduct() async {
    return await interFaceCartDataSource
        .countBasketProduct()
        .then((value) => countBasketProducts.value = value);
  }

  @override
  Future<String> payment() async {
    return await interFaceCartDataSource.payment();
  }
}

final cartRepository = CartRepository(
    interFaceCartDataSource:
        CartRemoteDataSource(httpClient: DioManager().dio));
