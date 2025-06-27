import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/features/login/data/models/login_request_body.dart';
import 'package:laza/features/login/data/repos/login_repo.dart';
import 'login_state.dart' hide Success;

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(loginRequestBody);
    switch (result) {
      case Success(data: final loginResponse):
        emit(LoginState.success(loginResponse));
      case Failure(errorHandler: final error):
        emit(LoginState.error(error: error.apiErrorModel.message!));
    }
  }
}
