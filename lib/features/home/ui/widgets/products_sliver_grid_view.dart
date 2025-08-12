import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/routing/routes.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/ui/widgets/product_item.dart';

class ProductsSliverGridView extends StatelessWidget {
  const ProductsSliverGridView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .575,
          crossAxisSpacing: 25.w,
          mainAxisSpacing: 15.h,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(
                context,
              ).push(Routes.detailsScreen, extra: products[index]);
            },
            child: ProductItem(product: products[index]),
          );
        }, childCount: products.length),
      ),
    );
  }
}
