import 'package:flutter/material.dart';

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
      itemCount: images.length,
      itemBuilder:
          (context, index) => Image.network(images[index], fit: BoxFit.cover),
    );
  }
}
