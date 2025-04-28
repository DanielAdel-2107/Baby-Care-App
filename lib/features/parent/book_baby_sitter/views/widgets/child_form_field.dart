import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/models/child_model.dart';
import 'package:flutter/material.dart';

class ChildrenFormField extends StatelessWidget {
  const ChildrenFormField({
    super.key,
    this.title,
    required this.value,
    this.icon,
    required this.children,
  });
  final String? title;
  final String value;
  final IconData? icon;
  final List<ChildModel> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.05,
          vertical: context.screenHeight * 0.007,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  children.isEmpty
                      ? Text(
                          title!,
                          style: AppTextStyles.title18PrimaryColorW500,
                        )
                      : SizedBox(),
                  children.isEmpty
                      ? Text(
                          value,
                          style: AppTextStyles.title16Black54,
                        )
                      : SizedBox(),
                  ...List.generate(
                    children.length,
                    (index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Child ${index + 1}",
                            style: AppTextStyles.title18PrimaryColorW500),
                        Text(
                          "name: ${children[index].name}  , age: ${children[index].age}",
                          style: AppTextStyles.title16Black54,
                        ),
                      ],
                    ),
                  ),
                  // ...List.generate(
                  //   children.length,
                  //   (index) => Text(
                  //     "name: ${children[index].name}  , age: ${children[index].age}",
                  //     style: AppTextStyles.title16Black54,
                  //   ),
                  // ),
                ],
              ),
            ),
            CustomIconButton(
              icon: icon!,
              iconSize: context.screenWidth * 0.08,
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}
