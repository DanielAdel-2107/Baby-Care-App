// ignore_for_file: deprecated_member_use

import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class CustomGradiant extends StatelessWidget {
  const CustomGradiant({
    super.key,
    required this.currentPage,
    required this.child,
  });

  final int currentPage;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
            vertical: context.screenHeight * 0.02),
        width: context.screenWidth,
        height: context.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.9),
              Colors.black,
            ],
          ),
        ),
        child: child);
  }
}
