import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomRowLable extends StatelessWidget {
  const CustomRowLable({
    super.key,
    required this.label,
    required this.icon,
    this.iconColor,
  });
  final String label;
  final IconData icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        Text(
          label,
          style: AppTextStyles.title17Black54Bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
