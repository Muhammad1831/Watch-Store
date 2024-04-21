import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/resource/app_api.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial()) {
    emit(LoggedoutState());
  }
  final Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(LodingState());

    try {
      await _dio.post(
        AppApi.sendSms,
        data: {"mobile": mobile},
      ).then((value) {
        debugPrint(value.toString());

        if (value.statusCode == 201) {
          emit(SentState());
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

        if (value.statusCode == 201) {
          emit(VerifyedState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
