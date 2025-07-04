import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/core/networking/api_service.dart';
import 'package:laza/core/networking/dio_factory.dart';
import 'package:laza/features/home/data/repos/home_repo.dart';
import 'package:laza/features/login/data/repos/login_repo.dart';
import 'package:laza/features/signup/data/repos/signup_repo.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  // home products,categories
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
