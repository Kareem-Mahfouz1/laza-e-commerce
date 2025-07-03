import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/core/networking/api_service.dart';
import 'package:laza/core/networking/dio_factory.dart';
import 'package:laza/features/home/data/repos/home_repo.dart';
import 'package:laza/features/home/logic/cubit/products_cubit.dart';
import 'package:laza/features/login/data/repos/login_repo.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';
import 'package:laza/features/signup/data/repos/signup_repo.dart';
import 'package:laza/features/signup/logic/cubit/signup_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  // home products
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<ProductsCubit>(() => ProductsCubit(getIt()));
}
