import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';

class ScreenAppbar extends StatelessWidget {
  const ScreenAppbar({super.key, required this.title, this.backButton = true});

  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: kHorizontalPadding,
        right: kHorizontalPadding,
        top: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.lightGrey,
            ),
            child:
                backButton
                    ? IconButton(
                      iconSize: 28,
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        GoRouter.of(context).canPop()
                            ? GoRouter.of(context).pop()
                            : null;
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF1D1E20),
                      ),
                    )
                    : null,
          ),
          Text(title, style: Styles.font17BlackSemiBold),
          Container(width: 45.w),
        ],
      ),
    );
  }
}
