import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/repository/cart_repository.dart';
import 'package:watch_store/models/cart_model.dart';
part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final CartRepository cartRepository;

  BasketBloc({required this.cartRepository}) : super(BasketInitialState()) {
    CartModel cartModel;
    on<BasketEvent>((event, emit) async {
      try {
        if (event is BasketInitialEvent) {
          emit(BasketLodingState());
          cartModel = await cartRepository.getUserCart();
          emit(BasketLoddedState(cartModel: cartModel));
        } else if (event is BasketDeleteEvent) {
          emit(BasketLodingState());
          cartModel =
              await cartRepository.deleteFromCart(productId: event.productId);
          emit(BasketDeleteState(cartModel: cartModel));
        } else if (event is BasketRemoveEvent) {
          cartModel =
              await cartRepository.removeFromCart(productId: event.productId);
          emit(BasketRemoveState(cartModel: cartModel));
        } else if (event is BasketAddEvent) {
          cartModel =
              await cartRepository.addToCart(productId: event.productId);
          emit(BasketAddState(cartModel: cartModel));
        } else if (event is BasketCountProductEvent) {
          await cartRepository.countBasketProduct();
        } else if (event is BasketPaymentEvent) {
          var payment = await cartRepository.payment();
          emit(BasketPaymentState(payment));
        }
      } catch (e) {
        emit(BasketErrorState());
      }
    });
  }
}
