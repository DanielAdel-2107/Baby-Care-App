import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_page_view_details.dart';
import 'package:flutter/material.dart';

class WelcomeToBabyCare extends StatelessWidget {
  const WelcomeToBabyCare({super.key, required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingPageViewDetails(
      currentPage: currentStep,
      title: "Welcome to Baby Care!",
      subtitle: "Finding the perfect babysitter just got easier.",
      image: AppImages.welcomToBabyCare,
    );
  }
}
