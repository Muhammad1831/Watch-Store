import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:watch_store/models/user_register_model.dart';
import 'package:watch_store/constant/app_api.dart';
import 'package:watch_store/constant/app_dimens.dart';
import 'package:watch_store/screens/register/cubit/register_state.dart';
import 'package:watch_store/utils/shared_preferences_key.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterStateInitional());

  Dio dio = Dio();

  register({required UserRegister user}) async {
    emit(RegisterStateLoding());

    String? token =
        SharedPreferencesManager().getString(SharedPreferencesKey.token);
    dio.options.headers['Authorization'] = 'Bearer $token';

    try {
      await dio
          .post(AppApi.register,
              data: FormData.fromMap(user.toMap()),
              options: Options(
                contentType: 'application/json',
                responseType: ResponseType.json,
                method: 'POST',
              ))
          .then((value) {
        debugPrint(value.statusCode.toString());

        if (value.statusCode == 201) {
          emit(RegisterStateCompeleted());
        } else {
          emit(RegisterStateError());
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(RegisterStateError());
    }
  }

  pickeTheLocation({required context}) async {
    try {
      await showSimplePickerLocation(
              context: context,
              initCurrentUserPosition:
                  const UserTrackingOption.withoutUserPosition(),
              isDismissible: false,
              zoomOption: const ZoomOption(initZoom: 12),
              radius: AppDimens.verySmall,
              title: 'انتخاب موقعیت مکانی',
              textCancelPicker: 'لغو',
              textConfirmPicker: 'انتخاب')
          .then((value) => emit(RegisterStateLocationPicked(location: value)));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
