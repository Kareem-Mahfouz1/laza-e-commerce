import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/validators.dart';
import 'package:laza/core/widgets/app_text_form_field.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObsecureText = true;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    emailController = context.read<LoginCubit>().emailController;
    formKey = context.read<LoginCubit>().formKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          spacing: 20,
          children: [
            AppTextFormField(
              labelText: 'Email Address',
              validator: Validator.validateEmailAddress,
              controller: emailController,
            ),
            AppTextFormField(
              labelText: 'Password',
              validator: Validator.validatePassword,
              controller: passwordController,
              isObsecureText: _isObsecureText,
              isFinalField: true,
              sufficIcon: GestureDetector(
                child: Icon(
                  _isObsecureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onTap:
                    () => setState(() {
                      _isObsecureText = !_isObsecureText;
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
