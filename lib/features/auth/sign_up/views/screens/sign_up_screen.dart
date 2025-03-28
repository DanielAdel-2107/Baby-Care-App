import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/features/auth/sign_up/views/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kLightPrimaryColor.withOpacity(0.4),
      body: SignUpScreenBody(),
    );
  }
}
