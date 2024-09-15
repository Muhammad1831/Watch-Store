import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/repository/product_details_repository.dart';
import 'package:watch_store/models/product_details_model.dart';
part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  InterFaceProductDetailsRepository interFaceProductDetailsRepository;

  ProductDetailsBloc({required this.interFaceProductDetailsRepository})
      : super(ProductDetailsLoding()) {
    on<ProductDetailsEvent>((event, emit) async {
      if (event is ProductDetailsInitial) {
        emit(ProductDetailsLoding());

        ProductDetailsModel productDetails =
            await interFaceProductDetailsRepository.getProductDetails(event.id);
        emit(ProductDetailsLodded(productDetailsModel: productDetails));
      } else {
        emit(ProductDetailsError());
      }
    });
  }
}
