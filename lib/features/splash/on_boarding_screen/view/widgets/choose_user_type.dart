import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/components/custom_text_button_with_icon.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class ChooseUserType extends StatelessWidget {
  const ChooseUserType({
    super.key,
    this.onPressedNext,
    this.onPressedBack,
  });
  final Function()? onPressedNext, onPressedBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomElevatedButton(
          name: "Find A Child Core",
          onPressed: () {
            context.pushReplacementScreen(RouteNames.signInScreen);
          },
        ),
        CustomTextButtonWithIcon(
          title: "I Am A Sitter",
          icon: Icons.arrow_forward_ios_rounded,
          onPressed: () {
            context.pushReplacementScreen(RouteNames.signInScreen);
          },
        )
      ],
    );
  }
}
