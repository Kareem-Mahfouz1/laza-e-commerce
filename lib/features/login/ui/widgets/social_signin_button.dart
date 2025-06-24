import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/theming/styles.dart';

class SocialSigninButton extends StatelessWidget {
  const SocialSigninButton({
    super.key,
    required this.backgroundColor,
    required this.logo,
    required this.text,
  });
  final Color backgroundColor;
  final String logo;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(logo, height: 26),
            SizedBox(width: 4),
            Text(text, style: Styles.font17WhiteSemiBold),
          ],
        ),
      ),
    );
  }
}
