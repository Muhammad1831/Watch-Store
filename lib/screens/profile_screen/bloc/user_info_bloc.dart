import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/repository/user_info_repository.dart';
import 'package:watch_store/models/user_profile_model.dart';
part 'user_info_event.dart';
part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  InterFaceUserInfoRepository userInfoRepository;

  UserInfoBloc(this.userInfoRepository) : super(UserInfoInitialState()) {
    on<UserInfoEvent>((event, emit) async {
      if (event is UserInfoInitialEvent) {
        emit(UserInfoLodingState());
        UserProfileModel userProfileModel =
            await userInfoRepository.getUserProfile();

        emit(UserInfoLoaddedState(userProfileModel: userProfileModel));
      } else {
        emit(UserInfoErrorState());
      }
    });
  }
}
