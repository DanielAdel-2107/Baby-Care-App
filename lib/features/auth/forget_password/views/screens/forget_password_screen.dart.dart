import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/features/auth/forget_password/views/widgets/forget_password_screen_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScrren extends StatelessWidget {
  const ForgetPasswordScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kLightPrimaryColor,
      body: ForgetPasswordScreenBody(),
    );
  }
}
