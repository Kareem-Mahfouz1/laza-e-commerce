import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helpers/constants.dart';

class SigninAppbar extends StatelessWidget {
  const SigninAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: kHorizontalPadding,
        left: kHorizontalPadding,
        top: 36.h,
      ),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF5F6FA),
            ),
            child: IconButton(
              iconSize: 28,
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1D1E20)),
            ),
          ),
        ],
      ),
    );
  }
}
