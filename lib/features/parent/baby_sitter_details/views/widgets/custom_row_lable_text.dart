import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomRowLabelText extends StatelessWidget {
  const CustomRowLabelText({
    super.key,
    required this.lable,
    required this.value,
  });
  final String lable;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lable,
          style: AppTextStyles.title17Black54Bold,
        ),
        Text(
          value,
          style: AppTextStyles.title16Black54,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
