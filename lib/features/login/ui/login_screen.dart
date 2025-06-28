import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/core/widgets/bottom_app_button.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';
import 'package:laza/features/login/ui/widgets/login_cubit_listener.dart';
import 'package:laza/features/login/ui/widgets/login_form.dart';
import 'package:laza/features/login/ui/widgets/signin_appbar.dart';
import 'package:laza/features/login/ui/widgets/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SigninAppbar(),
              SizedBox(height: 15.h),
              Column(
                children: [
                  Text('Welcome', style: Styles.font28BlackSemiBold),
                  Text(
                    'Please enter your data to continue',
                    style: Styles.font15GreyRegular,
                  ),
                ],
              ),
              SizedBox(height: 152.h),
              LoginForm(),
              SizedBox(height: 100.h),
              LoginCubitListener(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 25.h,
        children: [
          TermsAndConditions(),
          BottomAppButton(
            text: 'Login',
            onPressed: () {
              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                context.read<LoginCubit>().emitLoginState();
              }
            },
          ),
        ],
      ),
    );
  }
}
