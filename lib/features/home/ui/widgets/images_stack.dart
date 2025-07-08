import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza/core/theming/color_manager.dart';
import 'package:laza/features/home/ui/widgets/details_appbar.dart';
import 'package:laza/features/home/ui/widgets/images_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesStack extends StatelessWidget {
  const ImagesStack({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .56,
          child: ImagesPageView(pageController: _pageController, images: []),
        ),
        const DetailsAppbar(),
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              onDotClicked: (index) {
                print(
                  '-------------------------------${(index - _pageController.page!.toInt()).abs() * 200}',
                );
                _pageController.animateToPage(
                  index,
                  duration: Duration(
                    milliseconds: (index - _pageController.page!.toInt()) * 200,
                  ),
                  curve: Curves.easeIn,
                );
              },
              effect: WormEffect(
                activeDotColor: ColorManager.primary,
                dotColor: ColorManager.grey,
                dotWidth: 20,
                dotHeight: 7,
                spacing: 10,
              ),
              count: 3,
            ),
          ),
        ),
      ],
    );
  }
}
