import 'package:flutter/material.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    this.style, this.alignment,
  });
  final Function()? onPressed;
  final String title;
  final TextStyle? style;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment:alignment?? Alignment.topCenter,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: style ?? AppTextStyles.title18PrimaryColorW500,
      ),
    );
  }
}
