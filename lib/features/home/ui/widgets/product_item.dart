import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/core/helpers/assets.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/core/theming/styles.dart';
import 'package:laza/features/home/data/models/product.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(color: ColorManager.primary),
                ),
              ),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: product.images[0],
                fit: BoxFit.cover,
                height: 200.h,
              ),
              Positioned(
                right: 12.w,
                top: 15.h,
                child: GestureDetector(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .3),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: .6),
                            width: 1,
                          ),
                        ),
                        child: SvgPicture.asset(
                          Assets.heartIconSvg,
                          width: 20.w,
                          height: 20.h,
                          // TODO: implement wishlist functionality
                          colorFilter: ColorFilter.mode(
                            const Color.fromARGB(255, 65, 69, 74),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          product.title,
          style: Styles.font13BlackMedium,
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '\$${product.price}',
          style: Styles.font13BlackMedium.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
