import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class LocationTabBarView extends StatelessWidget {
  const LocationTabBarView({
    super.key,
    required this.locationName,
  });
  final String locationName;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            locationName,
            style: AppTextStyles.title24PrimaryColorBold,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.08,
        ),
        Icon(
          Icons.location_on_outlined,
          color: Colors.black45,
          size: context.screenWidth * 0.08,
        )
      ],
    );
  }
}
