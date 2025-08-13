import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/core/networking/api_error_model.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/data/models/product_pagination_query.dart';
import 'package:laza/features/home/data/repos/home_repo.dart';

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit(this.homeRepo) : super(ProductsState.initial());
  final int _limit = 10;
  int _offset = 0;
  bool isLoading = false;
  bool _hasMore = true;
  // ignore: prefer_final_fields
  List<ProductModel> _allProducts = [];

  void getInitialProducts() async {
    _offset = 0;
    _hasMore = true;
    _allProducts.clear();
    emit(ProductsState.loading());
    await _getProducts();
  }

  void getMoreProducts() async {
    if (_hasMore && !isLoading) {
      await _getProducts();
    }
  }

  Future<void> _getProducts() async {
    isLoading = true;
    final result = await homeRepo.getProducts(
      ProductPaginationQuery(limit: _limit, offset: _offset),
    );
    switch (result) {
      case Success(data: final products):
        if (products.isEmpty) {
          _hasMore = false;
        } else {
          _offset += _limit;
          _allProducts.addAll(products);
          emit(ProductsState.success(List<ProductModel>.from(_allProducts)));
        }
        break;
      case Failure(apiErrorModel: final errorModel):
        emit(ProductsState.error(errorModel: errorModel));
        break;
    }
    isLoading = false;
  }
}
