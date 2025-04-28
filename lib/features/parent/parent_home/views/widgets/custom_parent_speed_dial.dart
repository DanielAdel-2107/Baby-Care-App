import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomParentSpeedDial extends StatelessWidget {
  const CustomParentSpeedDial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      backgroundColor: AppColors.kPrimaryColor,
      overlayColor: Colors.white,
      foregroundColor: Colors.white,
      overlayOpacity: 0.5,
      spacing: context.screenHeight * 0.01,
      children: [
        customSpeedDialChild(
          icon: Icons.baby_changing_station,
          label: "Requests",
          onTap: () {
            context.pushScreen(RouteNames.parentRequetsScreen);
          },
        ),
        customSpeedDialChild(
          icon: Icons.headset_mic_rounded,
          label: "Chats With Gemini",
          onTap: () {
            context.pushScreen(RouteNames.geminiChatScreen);
          },
        ),
        customSpeedDialChild(
          icon: Icons.headset_mic_rounded,
          label: "Logout",
          onTap: () {
            context.pushAndRemoveUntilScreen(RouteNames.signInScreen);
          },
        ),
      ],
    );
  }

  SpeedDialChild customSpeedDialChild({
    required IconData icon,
    required String label,
    Function()? onTap,
  }) {
    return SpeedDialChild(
      child: Icon(icon),
      label: label,
      labelStyle: AppTextStyles.title16PrimaryColorW500,
      onTap: onTap,
      foregroundColor: AppColors.kPrimaryColor,
    );
  }
}
