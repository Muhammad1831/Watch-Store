part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchEventLoaded extends SearchEvent {
  final String searchKey;
  const SearchEventLoaded({required this.searchKey});

  @override
  List<Object> get props => [searchKey];
}
