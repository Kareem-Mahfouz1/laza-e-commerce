part of 'category_products_cubit.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const factory CategoryProductsState.initial() = _Initial;
  const factory CategoryProductsState.loading() = CategoryProductsLoading;
  const factory CategoryProductsState.success(List<ProductModel> products) =
      CategoryProductsSuccess;
  const factory CategoryProductsState.failure({required String error}) =
      CategoryProductsFailure;
}
