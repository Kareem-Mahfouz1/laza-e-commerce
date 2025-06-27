import 'package:flutter/material.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/validators.dart';
import 'package:laza/core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
              labelText: 'Email Address',
              validator: Validator.validateEmailAddress,
            ),
            AppTextFormField(
              labelText: 'Password',
              validator: Validator.validatePassword,
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
