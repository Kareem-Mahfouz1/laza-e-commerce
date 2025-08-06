import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/ui/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
    required this.products,
    required this.showLoader,
  });
  final List<ProductModel> products;
  final bool showLoader;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index < products.length) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(
                  context,
                ).push(Routes.detailsScreen, extra: products[index]);
              },
              child: ProductItem(product: products[index]),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }, childCount: showLoader ? products.length + 1 : products.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .575,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 15.h,
        ),
      ),
    );
  }
}
