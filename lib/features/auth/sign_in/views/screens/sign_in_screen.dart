import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/sign_in_screen_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kLightPrimaryColor.withOpacity(0.4),
      body: SignInScreenBody(),
    );
  }
}
