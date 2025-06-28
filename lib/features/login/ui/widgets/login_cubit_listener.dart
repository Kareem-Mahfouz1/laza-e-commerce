import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';
import 'package:laza/features/login/logic/cubit/login_state.dart';

class LoginCubitListener extends StatelessWidget {
  const LoginCubitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is LoginLoading ||
              current is LoginSuccess ||
              current is LoginError,
      bloc: context.read<LoginCubit>(),
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                ),
          );
        } else if (state is LoginSuccess) {
          GoRouter.of(context).go(Routes.homeScreen);
        } else if (state is LoginError) {
          context.pop();
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  icon: const Icon(Icons.error, color: Colors.red, size: 40),
                  content: Text(state.error, style: Styles.font15BlackMedium),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text('Got it', style: Styles.font13BlackMedium),
                    ),
                  ],
                ),
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
