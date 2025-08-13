import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/signup/logic/cubit/signup_cubit.dart';
import 'package:laza/features/signup/logic/cubit/signup_state.dart';

class SignupCubitListener extends StatelessWidget {
  const SignupCubitListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                ),
          );
        } else if (state is SignupSuccess) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                  content: Text(
                    'Account created successfully! please Login.',
                    style: Styles.font15BlackMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                        GoRouter.of(
                          context,
                        ).pushReplacement(Routes.loginScreen);
                      },
                      child: Text('Got it', style: Styles.font13BlackMedium),
                    ),
                  ],
                ),
          );
        } else if (state is SignupError) {
          context.pop();
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  icon: const Icon(Icons.error, color: Colors.red, size: 40),
                  content: Text(
                    state.errorModel.message!,
                    style: Styles.font15BlackMedium,
                  ),
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
