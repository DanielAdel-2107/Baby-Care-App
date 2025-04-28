import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleAndShowMore extends StatelessWidget {
  const CustomTitleAndShowMore({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.title24PrimaryColorW500,
        ),
        CustomTextButton(
          title: "View All",
          style: AppTextStyles.title18Black,
          onPressed: onPressed,
        )
      ],
    );
  }
}

