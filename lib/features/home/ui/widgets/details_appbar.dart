import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/color_manager.dart';

class DetailsAppbar extends StatelessWidget {
  const DetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: kHorizontalPadding,
        left: kHorizontalPadding,
        top: 20.h,
      ),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.lightGrey,
            ),
            child: IconButton(
              iconSize: 28,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                GoRouter.of(context).canPop()
                    ? GoRouter.of(context).pop()
                    : null;
              },
              icon: const Icon(Icons.arrow_back, color: Color(0xFF1D1E20)),
            ),
          ),
        ],
      ),
    );
  }
}
