import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggelSwithButton extends StatefulWidget {
  const CustomToggelSwithButton({super.key});

  @override
  State<CustomToggelSwithButton> createState() =>
      _CustomToggelSwithButtonState();
}

class _CustomToggelSwithButtonState extends State<CustomToggelSwithButton> {
    int selectedIndex = 0;
  @override

  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: context.screenWidth * 0.26,
      minHeight: context.screenHeight * 0.06,
      cornerRadius: context.screenWidth * 0.5,
      activeBgColors: [
        [AppColors.kPrimaryColor],
        [AppColors.kPrimaryColor],
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: AppColors.kSecondColor.withOpacity(0.2),
      inactiveFgColor: Colors.white,
      labels: ['One Time', 'Full Time'],
      initialLabelIndex: selectedIndex,
      totalSwitches: 2,
      radiusStyle: true,
      onToggle: (index) {
        setState(() {
          selectedIndex = index!;
        });
      },
    );
  }
}
