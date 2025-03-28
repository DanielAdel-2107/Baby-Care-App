import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class PositionedBabySitterImage extends StatelessWidget {
  const PositionedBabySitterImage({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -context.screenWidth * 0.08,
      right: context.screenWidth * 0.05,
      child: CircleAvatar(
        radius: context.screenWidth * 0.1,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
