import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 75.h,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 15.h),
          alignment: Alignment.topCenter,
          shape: const ContinuousRectangleBorder(),
          backgroundColor: ColorManager.primary,
        ),
        onPressed: () {},
        child: Text('Sign up', style: Styles.font17WhiteMedium),
      ),
    );
  }
}
