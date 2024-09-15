import 'package:dio/dio.dart';
import 'package:watch_store/data/data_source/product_data_source.dart';
import 'package:watch_store/models/brands_model.dart';
import 'package:watch_store/models/product_model.dart';

abstract class InterFaceProductRepository {
  Future<List<BrandsModel>> getBrands();
  Future<List<ProductModel>> searchProduct(String searchKey);
  Future<List<ProductModel>> getProductsByCategory(int id);
  Future<List<ProductModel>> getProductsByBrand(int id);
  Future<List<ProductModel>> getProductsSortBy(String sortBy);
}

class ProductRepository implements InterFaceProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepository({required this.productRemoteDataSource});

  @override
  Future<List<BrandsModel>> getBrands() async{
    return await productRemoteDataSource.getBrands();
  }

  @override
  Future<List<ProductModel>> getProductsByBrand(int id) async {
    return await productRemoteDataSource.getProductsByBrand(id);
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(int id) async {
    return await productRemoteDataSource.getProductsByCategory(id);
  }

  @override
  Future<List<ProductModel>> getProductsSortBy(String sortBy) async {
    return await productRemoteDataSource.getProductsSortBy(sortBy);
  }

  @override
  Future<List<ProductModel>> searchProduct(String searchKey) async {
    return await productRemoteDataSource.searchProduct(searchKey);
  }
}

ProductRepository productListRepository = ProductRepository(
    productRemoteDataSource: ProductRemoteDataSource(httpClient: Dio()));
