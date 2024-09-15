import 'package:watch_store/data/config/config.dart';
import 'package:watch_store/data/data_source/user_info_data_source.dart';
import 'package:watch_store/models/user_address_model.dart';
import 'package:watch_store/models/user_profile_model.dart';
import 'package:watch_store/models/user_status_order_model.dart';

abstract class InterFaceUserInfoRepository {
  Future<UserProfileModel> getUserProfile();
  Future<UserAddressModel> getUserAddress();
  Future<UserStatusOrderModel> getUserReceivedOrders();
  Future<UserStatusOrderModel> getUserCancelledOrders();
  Future<UserStatusOrderModel> getUserProcessingOrders();
}

class UserInfoRepository implements InterFaceUserInfoRepository {
  InterFaceUserInfoDataSource interFaceUserInfoDataSource;

  UserInfoRepository({required this.interFaceUserInfoDataSource});

  @override
  Future<UserAddressModel> getUserAddress() async {
    return await interFaceUserInfoDataSource.getUserAddress();
  }

  @override
  Future<UserStatusOrderModel> getUserCancelledOrders() async {
    return await interFaceUserInfoDataSource.getUserCancelledOrders();
  }

  @override
  Future<UserStatusOrderModel> getUserProcessingOrders() async {
    return await interFaceUserInfoDataSource.getUserProcessingOrders();
  }

  @override
  Future<UserProfileModel> getUserProfile() async {
    return await interFaceUserInfoDataSource.getUserProfile();
  }

  @override
  Future<UserStatusOrderModel> getUserReceivedOrders() async {
    return await interFaceUserInfoDataSource.getUserReceivedOrders();
  }
}

var userInfoRepository = UserInfoRepository(
    interFaceUserInfoDataSource:
        UserInfoDataSource(httpClient: DioManager().dio));
