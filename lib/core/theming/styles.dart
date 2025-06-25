import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/color_manager.dart';

class Styles {
  static TextStyle font13BlackMedium = TextStyle(
    fontSize: 13.sp,
    color: ColorManager.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorManager.grey,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font15GreyRegular = TextStyle(
    fontSize: 15.sp,
    color: ColorManager.grey,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font15BlackMedium = TextStyle(
    fontSize: 15.sp,
    color: ColorManager.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font17WhiteMedium = TextStyle(
    fontSize: 17.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );
  static TextStyle font17WhiteSemiBold = TextStyle(
    fontSize: 17.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font28BlackSemiBold = TextStyle(
    fontSize: 28.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
}
