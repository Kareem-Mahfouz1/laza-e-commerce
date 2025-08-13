import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/core/networking/api_error_model.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/data/models/product_pagination_query.dart';
import 'package:laza/features/home/data/repos/home_repo.dart';

part 'category_products_state.dart';
part 'category_products_cubit.freezed.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final HomeRepo homeRepo;
  CategoryProductsCubit(this.homeRepo) : super(CategoryProductsState.initial());
  final int _limit = 10;
  int _offset = 0;
  bool isLoading = false;
  // bool isInitialLoading = false;
  bool _hasMore = true;
  // ignore: prefer_final_fields
  List<ProductModel> _allProducts = [];

  void getInitialCategoryProducts(int categoryId) async {
    _offset = 0;
    _hasMore = true;
    _allProducts.clear();
    emit(CategoryProductsState.loading());
    await _getProducts(categoryId);
  }

  void getMoreCategoryProducts(int categoryId) async {
    if (_hasMore && !isLoading) {
      await _getProducts(categoryId);
    }
  }

  Future<void> _getProducts(int categoryId) async {
    isLoading = true;
    final result = await homeRepo.getCategoryProducts(
      categoryId,
      ProductPaginationQuery(offset: _offset, limit: _limit),
    );
    switch (result) {
      case Success(data: final products):
        if (products.isEmpty) {
          _hasMore = false;
        } else {
          _offset += _limit;
          _allProducts.addAll(products);
          emit(
            CategoryProductsState.success(
              List<ProductModel>.from(_allProducts),
            ),
          );
        }
        break;
      case Failure(apiErrorModel: final errorModel):
        emit(CategoryProductsState.failure(errorModel: errorModel));
        break;
    }
    isLoading = false;
  }
}
