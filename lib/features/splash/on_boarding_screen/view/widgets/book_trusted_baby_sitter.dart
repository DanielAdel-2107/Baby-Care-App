import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_page_view_details.dart';
import 'package:flutter/material.dart';

class BookTrustedBabySitter extends StatelessWidget {
  const BookTrustedBabySitter({super.key, required this.currentStep});
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingPageViewDetails(
      currentPage: currentStep,
      title: "Schedule Babysitters Easily",
      image: AppImages.bookBabySitter,
      subtitle:"Book trusted babysitters in real-time, stress-free." ,
    );
  }
}
