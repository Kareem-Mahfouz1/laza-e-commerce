import 'package:flutter/material.dart';
import 'package:laza/core/helpers/assets.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({
    super.key,
    required this.pageController,
    required this.images,
  });
  final PageController pageController;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder:
          (context, index) =>
              Image.asset(Assets.testProduct, fit: BoxFit.cover),
    );
  }
}
