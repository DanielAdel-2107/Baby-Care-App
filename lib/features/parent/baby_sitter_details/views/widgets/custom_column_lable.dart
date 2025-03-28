import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomColumnLable extends StatelessWidget {
  const CustomColumnLable({
    super.key,
    required this.lable,
    required this.value,
  });
  final String lable, value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: AppTextStyles.title24PrimaryColorBold,
        ),
        Text(
          value,
          style: AppTextStyles.title18Black54,
        ),
      ],
    );
  }
}
