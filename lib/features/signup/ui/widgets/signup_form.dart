import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/validators.dart';
import 'package:laza/core/widgets/app_text_form_field.dart';
import 'package:laza/features/signup/logic/cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _isObsecureText = true;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    formKey = context.read<SignupCubit>().formKey;
    passwordController = context.read<SignupCubit>().passwordController;
    emailController = context.read<SignupCubit>().emailController;
    nameController = context.read<SignupCubit>().nameController;
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
              labelText: 'Name',
              validator: Validator.validateUsername,
              controller: nameController,
            ),
            AppTextFormField(
              labelText: 'Email Address',
              validator: Validator.validateEmailAddress,
              controller: emailController,
            ),
            AppTextFormField(
              labelText: 'Password',
              validator: Validator.validatePassword,
              controller: passwordController,
              isFinalField: true,
              isObsecureText: _isObsecureText,
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
