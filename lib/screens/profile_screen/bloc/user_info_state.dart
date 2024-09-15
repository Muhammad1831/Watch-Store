part of 'user_info_bloc.dart';

sealed class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

final class UserInfoInitialState extends UserInfoState {}

final class UserInfoLodingState extends UserInfoState {}

final class UserInfoLoaddedState extends UserInfoState {
  final UserProfileModel userProfileModel;

  const UserInfoLoaddedState({required this.userProfileModel});

  @override
  List<Object> get props => [userProfileModel];
}

final class UserInfoErrorState extends UserInfoState {}
