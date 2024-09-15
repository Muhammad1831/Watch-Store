part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsLoding extends ProductDetailsState {}

// ignore: must_be_immutable
final class ProductDetailsLodded extends ProductDetailsState {
  ProductDetailsModel productDetailsModel;

  ProductDetailsLodded({required this.productDetailsModel});
}

final class ProductDetailsError extends ProductDetailsState {}
