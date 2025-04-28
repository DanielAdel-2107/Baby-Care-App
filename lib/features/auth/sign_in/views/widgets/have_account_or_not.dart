import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.title,
    required this.btnName,
    this.onPressed,
  });
  final String title;
  final String btnName;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.title16Black,
        ),
        CustomTextButton(
          onPressed: onPressed,
          title: btnName,
          alignment: Alignment.center,
        )
      ],
    );
  }
}
