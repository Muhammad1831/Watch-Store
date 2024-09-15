part of 'product_list_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductListLoadingState extends ProductsState {}

final class ProductListErrorState extends ProductsState {}

final class ProductListLoaddedState extends ProductsState {
  final List<ProductModel> productList;

  const ProductListLoaddedState(this.productList);
}
