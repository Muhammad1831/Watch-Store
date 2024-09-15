import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

sealed class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

final class RegisterStateInitional extends RegisterState {}

final class RegisterStateLoding extends RegisterState {}

final class RegisterStateCompeleted extends RegisterState {}

final class RegisterStateError extends RegisterState {}

final class RegisterStateLocationPicked extends RegisterState {
  final GeoPoint? location;

  RegisterStateLocationPicked({required this.location});
}
