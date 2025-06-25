import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 75.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 15.h),
          alignment: Alignment.topCenter,
          shape: ContinuousRectangleBorder(),
          backgroundColor: ColorManager.primary,
        ),
        onPressed: () {
          GoRouter.of(context).push(Routes.signupScreen);
        },
        child: Text('Create an Account', style: Styles.font17WhiteMedium),
      ),
    );
  }
}
