import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';

class CatigoreyItem extends StatelessWidget {
  const CatigoreyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorManager.lightGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        "Adidas",
        style: Styles.font15BlackMedium.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
