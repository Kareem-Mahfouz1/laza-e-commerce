import 'package:flutter/material.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/validators.dart';
import 'package:laza/core/widgets/app_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          spacing: 20,
          children: [
            AppTextFormField(
              labelText: 'Username',
              validator: Validator.validateUsername,
            ),
            AppTextFormField(
              labelText: 'Password',
              validator: Validator.validatePassword,
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
            AppTextFormField(
              labelText: 'Email Address',
              validator: Validator.validateEmailAddress,
              isFinalField: true,
            ),
          ],
        ),
      ),
    );
  }
}
