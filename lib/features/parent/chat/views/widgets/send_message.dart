import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/components/custom_text_form_field.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({
    super.key,
    this.onPressed,
    required this.controller,
  });
  final Function()? onPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenHeight * 0.008,
          vertical: context.screenHeight * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.kLightPrimaryColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: "enter message...",
                controller: controller,
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.02,
            ),
            CustomIconButton(
              icon: Icons.send,
              iconSize: context.screenWidth * 0.07,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
