import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomBookBabySitterField extends StatelessWidget {
  const CustomBookBabySitterField({
    super.key,
    this.title,
    required this.value,
    this.icon,
    this.onPressed,
    this.loading = false,
  });
  final String? title;
  final String value;
  final IconData? icon;
  final Function()? onPressed;
  final bool? loading;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
          vertical: context.screenHeight * 0.007,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title != null
                      ? Text(title!,
                          style: AppTextStyles.title18PrimaryColorW500)
                      : SizedBox(),
                  Text(value, style: AppTextStyles.title18Black54)
                ],
              ),
            ),
            loading!
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  ))
                : icon != null
                    ? CustomIconButton(
                        icon: icon!,
                        iconSize: context.screenWidth * 0.07,
                        onPressed: onPressed,
                        iconColor: AppColors.kPrimaryColor,
                      )
                    : SizedBox()
          ],
        ),
      ),
    );
  }
}
