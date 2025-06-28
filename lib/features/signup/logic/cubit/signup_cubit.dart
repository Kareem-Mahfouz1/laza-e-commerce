import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/networking/api_result.dart';
import 'package:laza/features/signup/data/models/signup_request_body.dart';
import 'package:laza/features/signup/data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(SignupState.initial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void emitSignupState() async {
    emit(SignupState.loading());
    final result = await signupRepo.signup(
      SignupRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
        avatar: "https://picsum.photos/800", // Placeholder avatar URL
      ),
    );
    switch (result) {
      case Success(data: final signupResponse):
        emit(SignupState.success(signupResponse));
      case Failure():
        emit(
          SignupState.error(error: result.errorHandler.apiErrorModel.message!),
        );
    }
  }
}
