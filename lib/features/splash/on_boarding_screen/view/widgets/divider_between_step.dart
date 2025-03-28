import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class DividerBetweenSteps extends StatelessWidget {
  const DividerBetweenSteps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.05,
      child: Divider(
        color: Colors.white,
        thickness: 2,
      ),
    );
  }
}
