import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/home/data/models/category_model.dart';

class CatigoreyItem extends StatelessWidget {
  final CategoryModel category;
  const CatigoreyItem({super.key, required this.category});

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
        category.name,
        style: Styles.font15BlackMedium.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
