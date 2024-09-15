import 'package:equatable/equatable.dart';
import 'package:watch_store/models/brands_model.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => [];
}

final class ProductBrandListLoadingState extends BrandsState {}

final class ProductBrandListErrorState extends BrandsState {}

final class ProductListBrandLoaddedState extends BrandsState {
  final List<BrandsModel> brandsModel;

  const ProductListBrandLoaddedState(this.brandsModel);
}
