import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/core/theming/styles.dart';

class LoginRow extends StatelessWidget {
  const LoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?', style: Styles.font15GreyRegular),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.signinScreen);
          },
          child: Text(' Login', style: Styles.font15BlackMedium),
        ),
      ],
    );
  }
}
