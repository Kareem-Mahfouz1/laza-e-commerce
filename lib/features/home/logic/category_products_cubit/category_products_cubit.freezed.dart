// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_products_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryProductsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryProductsState()';
}


}

/// @nodoc
class $CategoryProductsStateCopyWith<$Res>  {
$CategoryProductsStateCopyWith(CategoryProductsState _, $Res Function(CategoryProductsState) __);
}


/// @nodoc


class _Initial implements CategoryProductsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryProductsState.initial()';
}


}




/// @nodoc


class CategoryProductsLoading implements CategoryProductsState {
  const CategoryProductsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryProductsState.loading()';
}


}




/// @nodoc


class CategoryProductsSuccess implements CategoryProductsState {
  const CategoryProductsSuccess(final  List<ProductModel> products): _products = products;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of CategoryProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProductsSuccessCopyWith<CategoryProductsSuccess> get copyWith => _$CategoryProductsSuccessCopyWithImpl<CategoryProductsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductsSuccess&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'CategoryProductsState.success(products: $products)';
}


}

/// @nodoc
abstract mixin class $CategoryProductsSuccessCopyWith<$Res> implements $CategoryProductsStateCopyWith<$Res> {
  factory $CategoryProductsSuccessCopyWith(CategoryProductsSuccess value, $Res Function(CategoryProductsSuccess) _then) = _$CategoryProductsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProductModel> products
});




}
/// @nodoc
class _$CategoryProductsSuccessCopyWithImpl<$Res>
    implements $CategoryProductsSuccessCopyWith<$Res> {
  _$CategoryProductsSuccessCopyWithImpl(this._self, this._then);

  final CategoryProductsSuccess _self;
  final $Res Function(CategoryProductsSuccess) _then;

/// Create a copy of CategoryProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(CategoryProductsSuccess(
null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductModel>,
  ));
}


}

/// @nodoc


class CategoryProductsFailure implements CategoryProductsState {
  const CategoryProductsFailure({required this.error});
  

 final  String error;

/// Create a copy of CategoryProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryProductsFailureCopyWith<CategoryProductsFailure> get copyWith => _$CategoryProductsFailureCopyWithImpl<CategoryProductsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryProductsFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CategoryProductsState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $CategoryProductsFailureCopyWith<$Res> implements $CategoryProductsStateCopyWith<$Res> {
  factory $CategoryProductsFailureCopyWith(CategoryProductsFailure value, $Res Function(CategoryProductsFailure) _then) = _$CategoryProductsFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CategoryProductsFailureCopyWithImpl<$Res>
    implements $CategoryProductsFailureCopyWith<$Res> {
  _$CategoryProductsFailureCopyWithImpl(this._self, this._then);

  final CategoryProductsFailure _self;
  final $Res Function(CategoryProductsFailure) _then;

/// Create a copy of CategoryProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CategoryProductsFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
