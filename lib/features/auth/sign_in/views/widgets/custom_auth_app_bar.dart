import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthAppBar     extends StatelessWidget {
  const CustomAuthAppBar({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icons.arrow_back_ios_rounded,
                onPressed: () {},
                iconSize: context.screenWidth * 0.05,
              ),
              CustomTextButton(
                title: "Skip",
                style: AppTextStyles.title20PrimaryColorW500,
                onPressed: () {},
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.title36PrimaryColorW500),
                Text(subtitle, style: AppTextStyles.title18Black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
