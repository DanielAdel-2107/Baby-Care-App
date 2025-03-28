import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:flutter/material.dart';

class StepNumber extends StatelessWidget {
  const StepNumber({
    super.key,
    this.isActive = false,
    required this.stepNumber,
  });
  final bool isActive;
  final String stepNumber;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isActive ? AppColors.kPrimaryColor : Colors.white,
      child: Text(stepNumber),
    );
  }
}
