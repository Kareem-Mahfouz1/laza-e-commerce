import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/shared_pref_helper.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/core/networking/dio_factory.dart';
import 'package:laza/features/login/data/models/login_request_body.dart';
import 'package:laza/features/login/data/models/login_response.dart';
import 'package:laza/features/login/data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitLoginState() async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );
    switch (result) {
      case Success(data: final loginResponse):
        await _saveUserTokens(loginResponse);
        emit(LoginState.success(loginResponse));
      case Failure(errorHandler: final error):
        emit(LoginState.error(error: error.apiErrorModel.message!));
    }
  }

  Future<void> _saveUserTokens(LoginResponse loginResponse) async {
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userAccessToken,
      loginResponse.accessToken,
    );
    await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userRefreshToken,
      loginResponse.refreshToken,
    );
    DioFactory.addTokenAfterLogin(loginResponse.accessToken);
  }
}
