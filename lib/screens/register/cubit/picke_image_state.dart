part of 'picke_image_cubit.dart';

sealed class PickeImageState extends Equatable {
  const PickeImageState();

  @override
  List<Object> get props => [];
}

final class PickeImageInitial extends PickeImageState {}

final class PickeImageLoding extends PickeImageState {}

final class PickeImageCompelet extends PickeImageState {}

final class PickeImageError extends PickeImageState {}
