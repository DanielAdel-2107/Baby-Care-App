import 'package:baby_care/core/components/custom_elevavted_button_with_title.dart';
import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class BookAndCancelButton extends StatelessWidget {
  const BookAndCancelButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
        ),
        height: context.screenHeight * 0.12,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButton(
                icon: Icons.close,
                onPressed: () => context.popScreen(),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ))
                  : CustomElevatedButtonWithIcon(
                      title: "Book Now",
                      icon: Icons.add,
                      iconAlignment: IconAlignment.start,
                      backgroundColor: AppColors.kPrimaryColor,
                      onPressed: onPressed,
                      textStyle: AppTextStyles.title18WhiteW500,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
