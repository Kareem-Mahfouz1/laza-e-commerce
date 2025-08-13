part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = ProductsLoading;
  const factory ProductsState.success(List<ProductModel> products) =
      ProductsSuccess;
  const factory ProductsState.error({required ApiErrorModel errorModel}) =
      ProductsError;
}
