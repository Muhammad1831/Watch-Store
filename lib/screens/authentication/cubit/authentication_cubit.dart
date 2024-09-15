import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/utils/shared_preferences_key.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial()) {
    String? token =
        SharedPreferencesManager().getString(SharedPreferencesKey.token);
    debugPrint('AuthenticationInitial is called !!!!!!!');
    debugPrint('token : $token');
    token == null ? emit(LoggedoutState()) : emit(LoggedinState());
  }

  final Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(LodingState());

    try {
      await _dio
          .post(AppApi.sendSms,
              data: {'mobile': mobile},
              options: Options(
                  method: 'POST',
                  contentType: 'application/json',
                  responseType: ResponseType.json))
          .then((value) {
        debugPrint(value.toString());

        if (value.statusCode == 201) {
          emit(SentState(mobile: mobile));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      debugPrint('>>>>> ${e.toString()}');
      emit(ErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LodingState());

    try {
      await _dio
          .post(AppApi.checkSmsCode,
              data: {'mobile': mobile, 'code': code},
              options: Options(
                  method: 'POST',
                  contentType: 'application/json',
                  responseType: ResponseType.json))
          .then((value) {
        debugPrint(value.toString());

        if (value.statusCode == 200 || value.statusCode == 201) {
          SharedPreferencesManager().setString(
              SharedPreferencesKey.token, value.data['data']['token']);

          debugPrint(
              'token : ${SharedPreferencesManager().getString(SharedPreferencesKey.token)}');

          if (value.data['data']['is_registered']) {
            emit(VerifyedIsRegisteredState());
          } else {
            emit(VerifyedNotRegisteredState());
          }
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }
}
