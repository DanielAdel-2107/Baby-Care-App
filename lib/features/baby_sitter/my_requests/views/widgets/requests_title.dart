import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class RequestsTitle extends StatelessWidget {
  const RequestsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.1,
          vertical: context.screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.kLightPrimaryColor, width: 3),
        ),
        child: Text(
          "Requests",
          style: AppTextStyles.title24PrimaryColorW500,
        ),
      ),
    );
  }
}
