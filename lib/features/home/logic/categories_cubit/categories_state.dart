part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = CategoriesLoading;
  const factory CategoriesState.success(List<CategoryModel> categories) =
      CategoriesSuccess;
  const factory CategoriesState.error({required String error}) =
      CategoriesError;
}
