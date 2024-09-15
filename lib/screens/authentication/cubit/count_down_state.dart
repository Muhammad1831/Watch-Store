import 'package:equatable/equatable.dart';

sealed class CountDownState extends Equatable {
  const CountDownState();

  @override
  List<Object?> get props => [];
}

final class CountDownInitial extends CountDownState {}

// ignore: must_be_immutable
final class CountDownDecrease extends CountDownState {
  int remainSeconds;
  CountDownDecrease({required this.remainSeconds});
  @override
  List<Object?> get props => [remainSeconds];
}

final class CountDownEnded extends CountDownState {}
