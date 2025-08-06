import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/helpers/constants.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/core/widgets/bottom_app_button.dart';
import 'package:laza/features/home/data/models/product_model.dart';
import 'package:laza/features/home/ui/widgets/description_column.dart';
import 'package:laza/features/home/ui/widgets/images_stack.dart';
import 'package:laza/features/home/ui/widgets/size_selector.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductModel product;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImagesStack(
                pageController: _pageController,
                images: widget.product.images,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Text(
                            widget.product.category.name,
                            style: Styles.font13GreyRegular,
                          ),
                          Spacer(),
                          Text('Price', style: Styles.font13GreyRegular),
                        ],
                      ),
                      NameAndPriceRow(product: widget.product),
                      SizedBox(height: 10.h),
                      (widget.product.category.slug != 'electronics' &&
                              widget.product.category.slug != 'furniture')
                          ? SizeSelector()
                          : Container(),
                      SizedBox(height: 20.h),
                      DescriptionColumn(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: Styles.font15BlackMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('with VAT,SD', style: Styles.font13GreyRegular),
                  ],
                ),
                Text(
                  "\$${widget.product.price}",
                  style: Styles.font17BlackSemiBold,
                ),
              ],
            ),
          ),
          BottomAppButton(text: 'Add to Cart', onPressed: () {}),
        ],
      ),
    );
  }
}

class NameAndPriceRow extends StatelessWidget {
  final ProductModel product;
  const NameAndPriceRow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            product.title,
            style: Styles.font22BlackSemiBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 30.w),
        Text('\$${product.price}', style: Styles.font22BlackSemiBold),
      ],
    );
  }
}
