import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/features/home/logic/cubit/products_cubit.dart';

class IsLoadingBlocConsumer extends StatelessWidget {
  const IsLoadingBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder:
          (context, state) =>
              context.read<ProductsCubit>().isLoading
                  ? const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                  : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}
