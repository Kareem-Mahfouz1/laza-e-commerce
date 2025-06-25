import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/login/ui/widgets/signin_appbar.dart';
import 'package:laza/features/login/ui/widgets/signin_row.dart';
import 'package:laza/features/login/ui/widgets/create_account_button.dart';
import 'package:laza/features/login/ui/widgets/social_signin.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SigninAppbar(),
            SizedBox(height: 15.h),
            Text('Let\'s Get Started', style: Styles.font28BlackSemiBold),
            SizedBox(height: 190.h),
            SocialSignin(),
            Spacer(),
            SigninRow(),
            SizedBox(height: 25.h),
            CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}
