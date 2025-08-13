import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/logic/products_cubit/products_cubit.dart';
import 'package:laza/features/home/ui/widgets/products_sliver_grid_view.dart';
import 'package:laza/features/home/ui/widgets/screen_appbar.dart';

class NewlyAddedScreen extends StatefulWidget {
  const NewlyAddedScreen({super.key});

  @override
  State<NewlyAddedScreen> createState() => _NewlyAddedScreenState();
}

class _NewlyAddedScreenState extends State<NewlyAddedScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    final cubit = context.read<ProductsCubit>();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 100 &&
          !cubit.isLoading) {
        cubit.getMoreProducts();
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
            SliverToBoxAdapter(child: ScreenAppbar(title: 'Newly Added')),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return ProductsSliverGridView(products: state.products);
                } else if (state is ProductsError) {
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
