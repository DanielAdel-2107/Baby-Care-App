import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/custom_gradiant.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/custom_on_boarding_page_view_details_body.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/translation.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingPageViewDetails extends StatelessWidget {
  const CustomOnBoardingPageViewDetails({
    super.key,
    required this.currentPage,
    required this.title,
    required this.image,
    required this.subtitle,
  });
  final int currentPage;
  final String title, image, subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
      child: CustomGradiant(
        currentPage: currentPage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Translation(),
            CustomOnBoardingPageViewDetailsBody(
              currentStep: currentPage,
              title: title,
              subTitle: subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
