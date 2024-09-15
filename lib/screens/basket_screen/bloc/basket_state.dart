part of 'basket_bloc.dart';

sealed class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

final class BasketInitialState extends BasketState {}

final class BasketLodingState extends BasketState {}

final class BasketLoddedState extends BasketState {
  final CartModel cartModel;
  const BasketLoddedState({required this.cartModel});

  @override
  List<Object> get props => [cartModel];
}

final class BasketErrorState extends BasketState {}

final class BasketRemoveState extends BasketState {
  final CartModel cartModel;
  const BasketRemoveState({required this.cartModel});

  @override
  List<Object> get props => [cartModel];
}

final class BasketDeleteState extends BasketState {
  final CartModel cartModel;
  const BasketDeleteState({required this.cartModel});

  @override
  List<Object> get props => [cartModel];
}

final class BasketAddState extends BasketState {
  final CartModel cartModel;
  const BasketAddState({required this.cartModel});

  @override
  List<Object> get props => [cartModel];
}

final class BasketPaymentState extends BasketState {
  final String? payment;
  const BasketPaymentState(this.payment);

  @override
  List<Object> get props => [payment!];
}
