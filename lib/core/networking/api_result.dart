import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/core/networking/api_error_handler.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const ApiResult._();

  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}
