part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListInitialEvent extends ProductListEvent {
  final dynamic id;
  const ProductListInitialEvent({required this.id});
}

class ProductGetListBrandEvent extends ProductListEvent {}

class ProductListByBrandEvent extends ProductListEvent {
  final dynamic id;
  const ProductListByBrandEvent({required this.id});
}

class ProductListSortByEvent extends ProductListEvent {
  final String sortBy;
  const ProductListSortByEvent({required this.sortBy});
}
