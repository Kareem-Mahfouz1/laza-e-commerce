import 'package:flutter/material.dart';
import 'package:laza/core/theming/styles.dart';

class SigninRow extends StatelessWidget {
  const SigninRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: Styles.font15GreyRegular),
        GestureDetector(
          onTap: () {},
          child: Text(' Signin', style: Styles.font15BlackMedium),
        ),
      ],
    );
  }
}
