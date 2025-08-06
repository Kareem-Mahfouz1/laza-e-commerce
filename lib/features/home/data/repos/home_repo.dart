import 'package:laza/core/networking/api_error_handler.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/core/networking/api_service.dart';
import 'package:laza/features/home/data/models/category_model.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/data/models/product_pagination_query.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);
  Future<ApiResult<List<ProductModel>>> getProducts(
    ProductPaginationQuery query,
  ) async {
    try {
      final response = await _apiService.getProducts(query.toJson());
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<CategoryModel>>> getCategories() async {
    try {
      final response = await _apiService.getCategories();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<ProductModel>>> getCategoryProducts(
    int categoryId,
    ProductPaginationQuery query,
  ) async {
    try {
      final response = await _apiService.getCategoryProducts(
        categoryId: categoryId,
        productsPaginationQuery: query.toJson(),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
