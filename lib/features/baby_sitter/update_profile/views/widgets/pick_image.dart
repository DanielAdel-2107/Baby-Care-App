import 'dart:io';

import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
    this.file,
    this.onPressed,
  });
  final File? file;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        file != null
            ? CircleAvatar(
                radius: context.screenWidth * 0.2,
                backgroundImage: FileImage(file!),
              )
            : CircleAvatar(
                radius: context.screenWidth * 0.2,
              ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: context.screenWidth * 0.05,
            backgroundColor: AppColors.kPrimaryColor.withOpacity(0.7),
            child: CustomIconButton(
              icon: Icons.upload_file,
              iconColor: Colors.white,
              iconSize: context.screenWidth * 0.05,
              onPressed: onPressed,
            ),
          ),
        )
      ],
    );
  }
}
