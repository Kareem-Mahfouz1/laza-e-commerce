import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/helpers/assets.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/validators.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/widgets/app_text_form_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(
            child: AppTextFormField(
              validator: Validator.validateSearch,
              floatingLabel: false,
              hintText: "Search...",
              labelText: "Search...",

              contentPadding: EdgeInsets.only(bottom: 15, top: 15, left: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              isFilled: true,
              fillColor: ColorManager.lightGrey,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 50.w,
              height: 50.h,
              padding: EdgeInsets.all(13.r),
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: SvgPicture.asset(
                Assets.searchIconSvg,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
