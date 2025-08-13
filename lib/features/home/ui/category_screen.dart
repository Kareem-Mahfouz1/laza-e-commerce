import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/data/models/category_model.dart';
import 'package:laza/features/home/logic/category_products_cubit/category_products_cubit.dart';
import 'package:laza/features/home/ui/widgets/products_sliver_grid_view.dart';
import 'package:laza/features/home/ui/widgets/screen_appbar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    final cubit = context.read<CategoryProductsCubit>();
    cubit.getInitialCategoryProducts(widget.category.id);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 300 &&
          !cubit.isLoading) {
        cubit.getMoreCategoryProducts(widget.category.id);
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
            SliverToBoxAdapter(
              child: ScreenAppbar(title: widget.category.name),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
              builder: (context, state) {
                if (state is CategoryProductsSuccess) {
                  return ProductsSliverGridView(products: state.products);
                } else if (state is CategoryProductsFailure) {
                  return SliverToBoxAdapter(
                    child: Text(state.errorModel.message!),
                  );
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
