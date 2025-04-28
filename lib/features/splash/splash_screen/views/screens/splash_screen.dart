// ignore_for_file: use_build_context_synchronously

import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/features/splash/splash_screen/views/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToOnBoardinfScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondColor,
      body: SplashScreenBody(),
    );
  }

  void navigateToOnBoardinfScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, RouteNames.onBoardingScreen);
    });
  }
}
