import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helpers/assets.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/features/login/ui/widgets/social_signin_button.dart';

class SocialSignin extends StatelessWidget {
  const SocialSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        spacing: 10.h,
        children: [
          SocialSigninButton(
            backgroundColor: Color(0xFF4267B2),
            logo: Assets.facebookLogoSvg,
            text: 'Facebook',
          ),
          SocialSigninButton(
            backgroundColor: Color(0xFFEA4335),
            logo: Assets.googleLogoSvg,
            text: 'Google',
          ),
        ],
      ),
    );
  }
}
