import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_page_view_details.dart';
import 'package:flutter/material.dart';

class MonitorYourChild extends StatelessWidget {
  const MonitorYourChild({super.key, required this.currentStep});
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingPageViewDetails(
      currentPage: currentStep,
      title: "Track Baby Growth",
      image: AppImages.monitorYourChild,
      subtitle: "Monitor your child’s milestones with visual charts.",
    );
  }
}
