import 'package:dio/dio.dart';
import 'package:watch_store/models/home_model.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class InterFaceHomeDataSource {
  Future<HomeModel> getHome();
}

class HomeRemoteDataSource implements InterFaceHomeDataSource {
  final Dio httpClient;

  HomeRemoteDataSource({required this.httpClient});

  @override
  Future<HomeModel> getHome() async {  
    final HomeModel homeModel;
    try {
      var response = await httpClient.get(AppApi.home);

      ResponseValidator.validateStatusCode(statusCode: response.statusCode ?? 0);
      homeModel = HomeModel.fromJson(response.data['data']);

      return homeModel;
    } catch (e) {
      rethrow;
    }
  }
}
