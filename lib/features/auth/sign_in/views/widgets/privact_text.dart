import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PrivacyText extends StatelessWidget {
  const PrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: AppTextStyles.title16Black,
          children: [
            TextSpan(text: "By signing in, I agree with "),
            TextSpan(
              text: "Terms of Use",
              style: AppTextStyles.title16PrimaryColorW500,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: AppTextStyles.title16PrimaryColorW500,
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
          ],
        ),
      ),
    );
  }
}
