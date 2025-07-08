import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';

class SizeItem extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeItem({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 60.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.black : ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          size,
          style:
              isSelected
                  ? Styles.font17WhiteSemiBold
                  : Styles.font17BlackSemiBold,
        ),
      ),
    );
  }
}
