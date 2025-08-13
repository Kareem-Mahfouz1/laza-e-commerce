import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:laza/features/home/logic/products_cubit/products_cubit.dart';
import 'package:laza/features/home/ui/widgets/catigories_list.dart';
import 'package:laza/features/home/ui/widgets/hello_row.dart';
import 'package:laza/features/home/ui/widgets/home_appbar.dart';
import 'package:laza/features/home/ui/widgets/home_search_bar.dart';
import 'package:laza/features/home/ui/widgets/products_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<ProductsCubit>().getInitialProducts();
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 18.h,
            children: [
              HomeAppbar(),
              HelloRow(),
              HomeSearchBar(),
              CatigoriesList(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Products', style: Styles.font17BlackSemiBold),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(Routes.popularProductsScreen);
                      },
                      child: Text('View All', style: Styles.font13GreyRegular),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsSuccess) {
                    return ProductsGridView(
                      products: state.products.take(4).toList(),
                    );
                  } else if (state is ProductsError) {
                    return Text(state.errorModel.message!);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Newly Added', style: Styles.font17BlackSemiBold),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(Routes.newlyAddedScreen);
                      },
                      child: Text('View All', style: Styles.font13GreyRegular),
                    ),
                  ],
                ),
              ),
              BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsSuccess) {
                    final randProducts = [...state.products]..shuffle();
                    return ProductsGridView(
                      products: randProducts.take(4).toList(),
                    );
                  } else if (state is ProductsError) {
                    return Text(state.errorModel.message!);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
