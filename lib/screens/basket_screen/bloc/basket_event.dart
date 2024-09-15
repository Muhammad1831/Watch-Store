part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

class BasketInitialEvent extends BasketEvent {}

class BasketDeleteEvent extends BasketEvent {
  final int? productId;
  const BasketDeleteEvent({required this.productId});

  @override
  List<Object> get props => [productId!];
}

class BasketRemoveEvent extends BasketEvent {
  final int? productId;
  const BasketRemoveEvent({required this.productId});

  @override
  List<Object> get props => [productId!];
}

class BasketAddEvent extends BasketEvent {
  final int? productId;
  const BasketAddEvent({required this.productId});

  @override
  List<Object> get props => [productId!];
}

final class BasketCountProductEvent extends BasketEvent {}

final class BasketPaymentEvent extends BasketEvent {}
