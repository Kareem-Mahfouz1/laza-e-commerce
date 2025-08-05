import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/helpers/assets.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/color_manager.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

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
          IconButton(
            icon: SvgPicture.asset(
              Assets.menuIconSvg,
              allowDrawingOutsideViewBox: true,
            ),
            iconSize: 30,
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorManager.lightGrey),
              fixedSize: WidgetStatePropertyAll(Size(45.w, 45.h)),
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              Assets.bagIconSvg,
              allowDrawingOutsideViewBox: true,
            ),
            iconSize: 30,
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(ColorManager.lightGrey),
              fixedSize: WidgetStatePropertyAll(Size(45.w, 45.h)),
            ),
          ),
        ],
      ),
    );
  }
}
