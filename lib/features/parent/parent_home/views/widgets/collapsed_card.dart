import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CollapsedCard extends StatelessWidget {
  const CollapsedCard({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.screenHeight * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  name,
                  style: AppTextStyles.title18Black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
