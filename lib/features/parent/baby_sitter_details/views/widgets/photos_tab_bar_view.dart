import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:flutter/material.dart';

class PhotosTabBarView extends StatelessWidget {
  const PhotosTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Image.asset(
          AppImages.bookBabySitter,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
