import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/models/product_model.dart';
import 'package:watch_store/data/repository/product_repository.dart';
import 'package:watch_store/screens/product_list_screen/bloc/product_list_state.dart';
import 'package:watch_store/screens/product_list_screen/bloc/brands_state.dart';
part 'product_list_event.dart';
part 'products_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  InterFaceProductRepository interFaceProductRepository;

  ProductListBloc(this.interFaceProductRepository)
      : super(ProductListState(
            productsState: ProductListLoadingState(),
            brandsState: ProductBrandListLoadingState())) {
    on<ProductListInitialEvent>((event, emit) async {
      emit(state.copyWith(productListState: ProductListLoadingState()));
      try {
        final productList =
            await interFaceProductRepository.getProductsByCategory(event.id);

        emit(state.copyWith(
            productListState: ProductListLoaddedState(productList)));
      } catch (e) {
        emit(state.copyWith(productListState: ProductListErrorState()));
      }
    });

    on<ProductGetListBrandEvent>(
      (event, emit) async {
        emit(state.copyWith(
            productBrandListState: ProductBrandListLoadingState()));
        try {
          final brandsList = await interFaceProductRepository.getBrands();
          emit(state.copyWith(
              productBrandListState: ProductListBrandLoaddedState(brandsList)));
        } catch (e) {
          emit(state.copyWith(
              productBrandListState: ProductBrandListErrorState()));
        }
      },
    );

    on<ProductListByBrandEvent>(
      (event, emit) async {
        emit(state.copyWith(productListState: ProductListLoadingState()));
        try {
          final productList =
              await interFaceProductRepository.getProductsByBrand(event.id);
          emit(state.copyWith(
              productListState: ProductListLoaddedState(productList)));
        } catch (e) {
          emit(state.copyWith(productListState: ProductListErrorState()));
        }
      },
    );

    on<ProductListSortByEvent>(
      (event, emit) async {
        emit(state.copyWith(productListState: ProductListLoadingState()));
        try {
          final productList =
              await interFaceProductRepository.getProductsSortBy(event.sortBy);
          emit(state.copyWith(
              productListState: ProductListLoaddedState(productList)));
        } catch (e) {
          emit(state.copyWith(productListState: ProductListErrorState()));
        }
      },
    );
  }
}
