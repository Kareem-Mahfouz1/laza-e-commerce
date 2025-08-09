import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/di/dependency_injection.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/helpers/shared_pref_helper.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/features/home/data/models/category_model.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/logic/category_products_cubit/category_products_cubit.dart';
import 'package:laza/features/home/ui/category_screen.dart';
import 'package:laza/features/home/ui/details_screen.dart';
import 'package:laza/features/login/logic/cubit/login_cubit.dart';
import 'package:laza/features/login/ui/get_started_screen.dart';
import 'package:laza/features/login/ui/login_screen.dart';
import 'package:laza/features/navigation/home_navigation.dart';
import 'package:laza/features/signup/logic/cubit/signup_cubit.dart';
import 'package:laza/features/signup/ui/signup_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    // redirect: (context, state) async {
    //   final userToken = await SharedPrefHelper.getSecuredString(
    //     SharedPrefKeys.userAccessToken,
    //   );

    //   final isAuth = userToken != null && userToken.isNotEmpty;
    //   final isLoggingIn = state.matchedLocation == Routes.loginScreen;
    //   final isSigningUp = state.matchedLocation == Routes.signupScreen;
    //   final isGettingStarted = state.matchedLocation == Routes.getStartedScreen;

    //   if (!isAuth) {
    //     // If not authenticated, allow access to auth-related screens
    //     if (isLoggingIn || isGettingStarted || isSigningUp) return null;
    //     return Routes.getStartedScreen;
    //   }

    //   // If authenticated, prevent going to login/getStarted
    //   if (isLoggingIn || isGettingStarted || isSigningUp) {
    //     return Routes.homeNavigationScreen;
    //   }

    //   return null; // No redirect
    // },
    routes: [
      GoRoute(
        path: '/',
        builder:
            (context, state) =>
                isUserLoggedIn
                    ? const HomeNavigation()
                    : const GetStartedScreen(),
      ),
      GoRoute(
        path: Routes.getStartedScreen,
        builder: (context, state) => const GetStartedScreen(),
      ),
      GoRoute(
        path: Routes.loginScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginCubit(getIt()),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        path: Routes.signupScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignupCubit(getIt()),
              child: const SignupScreen(),
            ),
      ),
      GoRoute(
        path: Routes.homeNavigationScreen,
        builder: (context, state) => const HomeNavigation(),
      ),
      GoRoute(
        path: Routes.detailsScreen,
        builder:
            (context, state) =>
                DetailsScreen(product: state.extra! as ProductModel),
      ),
      GoRoute(
        path: Routes.categoryScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => CategoryProductsCubit(getIt()),
              child: CategoryScreen(category: state.extra! as CategoryModel),
            ),
      ),
    ],
  );
}
