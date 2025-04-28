import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class CustomParentHomeScreenAppBar extends StatelessWidget {
  const CustomParentHomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.screenWidth * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.arrow_back_rounded,
            iconSize: context.screenWidth * 0.07,
            weight: 1200,
            onPressed: () {},
          ),
          Row(
            children: [
              CustomIconButton(
                icon: Icons.notifications_active_outlined,
                iconSize: context.screenWidth * 0.06,
                iconColor: Colors.black54,
                onPressed: () {},
              ),
              CircleAvatar(
                backgroundColor: AppColors.kLightPrimaryColor,
                radius: context.screenWidth * 0.055,
                child: Center(
                  child: CustomIconButton(
                    icon: Icons.menu,
                    iconColor: AppColors.kPrimaryColor,
                    iconSize: context.screenWidth * 0.06,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
