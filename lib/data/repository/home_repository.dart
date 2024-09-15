import 'package:dio/dio.dart';
import 'package:watch_store/data/data_source/home_data_source.dart';
import 'package:watch_store/models/home_model.dart';

abstract class InterFaceHomeRepository {
  Future<HomeModel> getHome();
}

class HomeRepository implements InterFaceHomeRepository {
  final InterFaceHomeDataSource interFaceHomeDataSource;

  HomeRepository({required this.interFaceHomeDataSource});

  @override
  Future<HomeModel> getHome() async {
    return await interFaceHomeDataSource.getHome();
  }
}

final homeRepository = HomeRepository(
    interFaceHomeDataSource: HomeRemoteDataSource(httpClient: Dio()));
