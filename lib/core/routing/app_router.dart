import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/di/dependency_injection.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';
import 'package:laza/features/login/ui/get_started_screen.dart';
import 'package:laza/features/login/ui/login_screen.dart';
import 'package:laza/features/signup/logic/cubit/signup_cubit.dart';
import 'package:laza/features/signup/ui/signup_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const GetStartedScreen()),
      GoRoute(
        path: Routes.loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        path: Routes.signupScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<SignupCubit>(),
              child: const SignupScreen(),
            ),
      ),
    ],
  );
}
