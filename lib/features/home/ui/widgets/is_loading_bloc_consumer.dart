import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/logic/products_cubt/products_cubit.dart';

class IsLoadingBlocConsumer extends StatelessWidget {
  const IsLoadingBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      buildWhen: (previous, current) => current is ProductsSuccess,
      listener: (context, state) {},
      builder: (context, state) {
        return !context.read<ProductsCubit>().isInitialLoading
            ? const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircularProgressIndicator(),
                ),
              ),
            )
            : const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
