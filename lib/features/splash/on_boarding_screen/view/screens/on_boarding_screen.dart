import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/book_trusted_baby_sitter.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/stay_notified.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/monitor_your_child.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/widgets/welcome_to_baby_care.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            WelcomeToBabyCare(
              currentStep: currentPage,
            ),
            BookTrustedBabySitter(
              currentStep: currentPage,
            ),
            MonitorYourChild(
              currentStep: currentPage,
            ),
            StayNotified(
              currentStep: currentPage,
            )
          ],
        ),
      ),
    );
  }
}
