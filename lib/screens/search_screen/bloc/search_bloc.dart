import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/repository/product_repository.dart';
import 'package:watch_store/models/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ProductRepository productRepository;
  List<ProductModel> products = [];

  SearchBloc({required this.productRepository}) : super(SearchStateEmpty()) {
    on<SearchEvent>((event, emit) async {
      if (event is SearchEventLoaded) {
        if (event.searchKey.isEmpty) {
          emit(SearchStateEmpty());
        } else {
          emit(SearchStateLoading());
          try {
            products = await productRepository.searchProduct(event.searchKey);
            emit(SearchStateLoaded(products: products));
          } catch (e) {
            emit(SearchStateError());
          }
        }
      }
    });
  }
}
