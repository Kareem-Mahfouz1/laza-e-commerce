import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/di/dependency_injection.dart';
import 'package:laza/core/helpers/assets.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/features/home/logic/cubit/products_cubit.dart';
import 'package:laza/features/home/ui/home_screen.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int currentIndex = 0;

  final List<Widget Function()> screens = [
    () => BlocProvider(
      create: (context) => getIt<ProductsCubit>(),
      child: HomeScreen(),
    ),
    () => HomeScreen(),
    () => HomeScreen(),
    // () => WishlistScreen(),
    // () => ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex](),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedItemColor: ColorManager.primary,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SizedBox.shrink(),
            icon: SvgPicture.asset(
              Assets.homeIconSvg,
              colorFilter: ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
              height: 22,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SizedBox.shrink(),
            icon: SvgPicture.asset(
              Assets.heartIconSvg,
              colorFilter: ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
              height: 24,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            activeIcon: SizedBox.shrink(),
            icon: SvgPicture.asset(
              Assets.profileIconSvg,
              colorFilter: ColorFilter.mode(ColorManager.grey, BlendMode.srcIn),
              height: 22,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
