import 'package:dio/dio.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/models/user_address_model.dart';
import 'package:watch_store/models/user_profile_model.dart';
import 'package:watch_store/models/user_status_order_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class InterFaceUserInfoDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<UserAddressModel> getUserAddress();
  Future<UserStatusOrderModel> getUserReceivedOrders();
  Future<UserStatusOrderModel> getUserCancelledOrders();
  Future<UserStatusOrderModel> getUserProcessingOrders();
}

class UserInfoDataSource implements InterFaceUserInfoDataSource {
  Dio httpClient;

  UserInfoDataSource({required this.httpClient});

  @override
  Future<UserProfileModel> getUserProfile() async {
    UserProfileModel userProfileModel;

    try {
      var response = await httpClient.post(AppApi.userProfile);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      userProfileModel = UserProfileModel.fromJson(response.data['data']);

      return userProfileModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserAddressModel> getUserAddress() async {
    UserAddressModel userAddressModel;

    try {
      var response = await httpClient.post(AppApi.userAddress);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      userAddressModel = UserAddressModel.fromJson(response.data['data']);

      return userAddressModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserStatusOrderModel> getUserCancelledOrders() async {
    UserStatusOrderModel userStatusOrderModel;

    try {
      var response = await httpClient.post(AppApi.userCancelledOrders);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      userStatusOrderModel =
          UserStatusOrderModel.fromJson(response.data['data']);

      return userStatusOrderModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserStatusOrderModel> getUserProcessingOrders() async {
    UserStatusOrderModel userStatusOrderModel;

    try {
      var response = await httpClient.post(AppApi.userProcessingOrders);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      userStatusOrderModel =
          UserStatusOrderModel.fromJson(response.data['data']);

      return userStatusOrderModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserStatusOrderModel> getUserReceivedOrders() async {
    UserStatusOrderModel userStatusOrderModel;

    try {
      var response = await httpClient.post(AppApi.userReceivedOrders);
      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      userStatusOrderModel =
          UserStatusOrderModel.fromJson(response.data['data']);

      return userStatusOrderModel;
    } catch (e) {
      rethrow;
    }
  }
}
