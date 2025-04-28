import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class RequestsTabBar extends StatelessWidget {
  const RequestsTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      labelStyle: AppTextStyles.title18PrimaryColorW500,
      unselectedLabelStyle: AppTextStyles.title18Black54WithOpacity,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.kLightPrimaryColor.withOpacity(0.6),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          child: Text("Pending"),
        ),
        Tab(
          child: Text("Accepted"),
        ),
        Tab(
          child: Text("Rejected"),
        ),
      ],
    );
  }
}
