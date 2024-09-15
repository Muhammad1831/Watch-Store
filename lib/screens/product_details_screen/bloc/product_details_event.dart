part of 'product_details_bloc.dart';

sealed class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ProductDetailsInitial extends ProductDetailsEvent {
  int id;

  ProductDetailsInitial({required this.id});
}
