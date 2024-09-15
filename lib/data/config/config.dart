import 'package:dio/dio.dart';
import 'package:watch_store/utils/shared_preferences_key.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

class AtuhorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token =
        SharedPreferencesManager().getString(SharedPreferencesKey.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

class DioManager {
  static final Dio _dio = Dio();

  Dio get dio {
    _dio.interceptors.add(AtuhorizationInterceptor());
    return _dio;
  }
}
