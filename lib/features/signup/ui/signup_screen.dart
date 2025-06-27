import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/core/widgets/bottom_app_button.dart';
import 'package:laza/features/signup/ui/widgets/signup_appbar.dart';
import 'package:laza/features/signup/ui/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              const SignupAppbar(),
              SizedBox(height: 15.h),
              Text('Sign Up', style: Styles.font28BlackSemiBold),
              SizedBox(height: 152.h),
              SignupForm(formKey: GlobalKey()),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppButton(text: 'Sign Up', onPressed: () {}),
    );
  }
}
