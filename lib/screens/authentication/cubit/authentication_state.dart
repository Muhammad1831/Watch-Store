part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class LodingState extends AuthenticationState {}

final class SentState extends AuthenticationState {}

final class VerifyedState extends AuthenticationState {}

final class ErrorState extends AuthenticationState {}

final class LoggedinState extends AuthenticationState {}

final class LoggedoutState extends AuthenticationState {}
