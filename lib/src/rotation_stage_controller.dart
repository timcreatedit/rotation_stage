import 'package:flutter/material.dart';
import 'package:rotation_stage/src/const/scroll_start_page.dart';

class RotationStageController extends ValueNotifier<double> {
  RotationStageController({
    this.viewportFraction = 0.2,
    int initialPage = kInfiniteScrollStartPage,
  })  : pageController = PageController(
          initialPage: initialPage,
          viewportFraction: viewportFraction,
        ),
        super(initialPage.toDouble()) {
    pageController.addListener(() {
      if (pageController.positions.isNotEmpty && pageController.page != null) {
        value = pageController.page!;
      }
    });
  }

  final double viewportFraction;
  final PageController pageController;

  void animateToPage(
    int page, {
    Duration duration = kThemeAnimationDuration,
    Curve curve = Curves.ease,
  }) {
    pageController.animateToPage(
      page,
      duration: duration,
      curve: curve,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
