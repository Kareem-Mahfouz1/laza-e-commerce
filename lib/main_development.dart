import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/app.dart';
import 'package:laza/core/di/dependency_injection.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(const LazaApp());
}
