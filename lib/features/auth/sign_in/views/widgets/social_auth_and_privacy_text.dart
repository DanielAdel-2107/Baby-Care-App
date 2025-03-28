import 'package:baby_care/core/components/custom_elevavted_button_with_title.dart';
import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/privact_text.dart';
import 'package:flutter/material.dart';

class SocialAuthAndPrivacyText extends StatelessWidget {
  const SocialAuthAndPrivacyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButtonWithIcon(
          title: "Connect With Google",
          image: AppImages.googleImage,
          onPressed: () {},
          textStyle: AppTextStyles.title18Black,
          backgroundColor: Colors.white,
          iconAlignment: IconAlignment.start,
          width: context.screenWidth * 0.9,
          height: context.screenHeight * 0.07,
        ),
        SizedBox(height: context.screenHeight * 0.01),
        CustomElevatedButtonWithIcon(
          title: "Connect With Facebook",
          onPressed: () {},
          backgroundColor: Colors.blue,
          image: AppImages.facebookImage,
          iconAlignment: IconAlignment.start,
          width: context.screenWidth * 0.9,
          height: context.screenHeight * 0.07,
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        PrivacyText(),
      ],
    );
  }
}
