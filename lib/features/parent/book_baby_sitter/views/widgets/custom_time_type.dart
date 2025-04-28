import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTimeType extends StatelessWidget {
  const CustomTimeType({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: context.screenWidth * 0.02,
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: context.screenWidth * 0.05,
        ),
        Text(
          title,
          style: AppTextStyles.title18GreyW500,
        ),
      ],
    );
  }
}
