import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/app.dart';
import 'package:laza/core/di/dependency_injection.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/shared_pref_helper.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  await chechIfUserIsLoggedIn();
  FlutterNativeSplash.remove();
  runApp(const LazaApp());
}

chechIfUserIsLoggedIn() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userAccessToken,
  );
  if (userToken != null && userToken.isNotEmpty) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
