import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:laza/core/networking/api_service.dart';
import 'package:laza/core/networking/dio_factory.dart';
import 'package:laza/features/login/data/repos/login_repo.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
