import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/core/widgets/bottom_app_button.dart';
import 'package:laza/features/signup/logic/cubit/signup_cubit.dart';
import 'package:laza/features/signup/ui/widgets/signup_appbar.dart';
import 'package:laza/features/signup/ui/widgets/signup_cubit_listener.dart';
import 'package:laza/features/signup/ui/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SignupAppbar(),
              SizedBox(height: 15.h),
              Text('Sign Up', style: Styles.font28BlackSemiBold),
              SizedBox(height: 152.h),
              SignupForm(),
              SizedBox(height: 100.h),
              SignupCubitListener(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppButton(
        text: 'Sign Up',
        onPressed: () {
          if (context.read<SignupCubit>().formKey.currentState!.validate()) {
            context.read<SignupCubit>().emitSignupState();
          }
        },
      ),
    );
  }
}
