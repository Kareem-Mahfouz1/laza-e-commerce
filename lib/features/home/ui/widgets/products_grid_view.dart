import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/ui/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {},
            child: ProductItem(product: products[index]),
          );
        }, childCount: products.length),
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
