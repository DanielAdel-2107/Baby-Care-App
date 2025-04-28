import 'package:baby_care/core/components/custom_text_form_field_with_title.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class UpdateProfileFields extends StatelessWidget {
  const UpdateProfileFields({
    super.key,
    required this.nameController,
    required this.ageController,
    required this.experianceController,
    required this.aboutMeController,
    required this.formKey,
  });
  final TextEditingController nameController,
      ageController,
      experianceController,
      aboutMeController;
  final GlobalKey formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: context.screenHeight * 0.01,
        children: [
          CustomTextFormFieldWithTitle(
            title: "Your Name",
            hintText: "enter your name",
            controller: nameController,
          ),
          CustomTextFormFieldWithTitle(
            title: "Your Age",
            hintText: "enter your age",
            controller: ageController,
          ),
          CustomTextFormFieldWithTitle(
            title: "Your Experience",
            hintText: "enter your experience",
            controller: experianceController,
          ),
          CustomTextFormFieldWithTitle(
            title: "About your self",
            hintText: "enter something",
            controller: aboutMeController,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
        ],
      ),
    );
  }
}
