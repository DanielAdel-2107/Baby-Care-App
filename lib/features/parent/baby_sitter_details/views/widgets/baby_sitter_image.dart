import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class BabySitterImage extends StatelessWidget {
  const BabySitterImage({
    super.key, required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.3,
      child: Stack(
        children: [
          Material(
            shape: const CircleBorder(),
            elevation: 20,
            child: CircleAvatar(
              radius: context.screenWidth * 0.15,
              backgroundImage: NetworkImage(
                image,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: context.screenWidth * 0.015,
            child: Icon(
              Icons.circle,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
