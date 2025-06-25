import 'package:go_router/go_router.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/features/login/ui/get_started_screen.dart';
import 'package:laza/features/signup/ui/signup_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const GetStartedScreen()),
      // GoRoute(
      //   path: Routes.signinScreen,
      //   builder: (context, state) => const SigninScreen(),
      // ),
      GoRoute(
        path: Routes.signupScreen,
        builder: (context, state) => const SignupScreen(),
      ),
    ],
  );
}
