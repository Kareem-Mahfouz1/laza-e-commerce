import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/home/logic/products_cubt/products_cubit.dart';
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
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    context.read<ProductsCubit>().getInitialProducts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<ProductsCubit>().getMoreProducts();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(child: HomeAppbar()),
            SliverToBoxAdapter(child: SizedBox(height: 18.h)),
            SliverToBoxAdapter(child: HelloRow()),
            SliverToBoxAdapter(child: SizedBox(height: 18.h)),
            SliverToBoxAdapter(child: HomeSearchBar()),
            SliverToBoxAdapter(child: SizedBox(height: 18.h)),
            SliverToBoxAdapter(child: CatigoriesList()),
            SliverToBoxAdapter(child: SizedBox(height: 18.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Products', style: Styles.font17BlackSemiBold),
                    Text('View All', style: Styles.font13GreyRegular),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 18.h)),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                final cubit = context.read<ProductsCubit>();
                if (state is ProductsSuccess) {
                  return ProductsGridView(
                    products: state.products,
                    showLoader: cubit.isLoading,
                  );
                } else if (state is ProductsError) {
                  return SliverToBoxAdapter(child: Text(state.error));
                } else {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
