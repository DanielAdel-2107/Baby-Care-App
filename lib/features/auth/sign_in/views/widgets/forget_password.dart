import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
    this.onPressed,
  });
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Forget your password?",style: AppTextStyles.title16Black,),
        CustomTextButton(title: "Reset here", onPressed: onPressed)
      ],
    );
  }
}
