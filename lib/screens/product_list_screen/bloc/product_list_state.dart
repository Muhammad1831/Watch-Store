import 'package:equatable/equatable.dart';
import 'package:watch_store/screens/product_list_screen/bloc/brands_state.dart';
import 'package:watch_store/screens/product_list_screen/bloc/product_list_bloc.dart';

class ProductListState extends Equatable {
  final ProductsState productsState;
  final BrandsState brandsState;

  const ProductListState(
      {required this.productsState, required this.brandsState});

  ProductListState copyWith({ProductsState? productListState,
      BrandsState? productBrandListState}) {
    return ProductListState(
        productsState: productListState ?? productsState,
        brandsState:
            productBrandListState ?? brandsState);
  }

  @override
  List<Object> get props => [productsState, brandsState];
}
