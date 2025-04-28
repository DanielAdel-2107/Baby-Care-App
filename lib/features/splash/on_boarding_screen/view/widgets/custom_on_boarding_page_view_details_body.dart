import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/choose_user_type.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/divider_between_step.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/step_number.dart';
import 'package:flutter/material.dart';

class CustomOnBoardingPageViewDetailsBody extends StatelessWidget {
  const CustomOnBoardingPageViewDetailsBody({
    super.key,
    required this.currentStep, required this.title, required this.subTitle,
  });
  final int currentStep;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.screenHeight * 0.05,
      children: [
        Row(
          spacing: context.screenWidth * 0.02,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StepNumber(
              isActive: currentStep >= 0,
              stepNumber: "1",
            ),
            DividerBetweenSteps(),
            StepNumber(
              isActive: currentStep >= 1,
              stepNumber: "2",
            ),
            DividerBetweenSteps(),
            StepNumber(
              isActive: currentStep >= 2,
              stepNumber: "3",
            ),
            DividerBetweenSteps(),
            StepNumber(
              isActive: currentStep >= 3,
              stepNumber: "4",
            ),

          ],
        ),
        Text(
          title,
          style: AppTextStyles.title28PrimaryColorW500,
          textAlign: TextAlign.center,
        ),
        Text(
          subTitle,
          style: AppTextStyles.title20WhiteW500,
          textAlign: TextAlign.center,
        ),
        ChooseUserType(),
      ],
    );
  }
}
