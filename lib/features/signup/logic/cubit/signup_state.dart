import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laza/core/networking/api_error_model.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = SignupLoading;
  const factory SignupState.success(T data) = SignupSuccess<T>;
  const factory SignupState.error({required ApiErrorModel errorModel}) =
      SignupError;
}
