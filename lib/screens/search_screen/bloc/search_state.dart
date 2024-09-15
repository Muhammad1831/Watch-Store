part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchStateEmpty extends SearchState {}

final class SearchStateLoaded extends SearchState {
  final List<ProductModel> products;
  const SearchStateLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

final class SearchStateLoading extends SearchState {}

final class SearchStateError extends SearchState {}
