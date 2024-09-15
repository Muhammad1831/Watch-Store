part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoding extends HomeState {}

final class HomeLoaded extends HomeState {
  final HomeModel home;
  const HomeLoaded(this.home);
}

final class HomeError extends HomeState {}
