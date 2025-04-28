import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:flutter/material.dart';

class Translation extends StatelessWidget {
  const Translation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(
          icon: Icons.g_translate_outlined,
          onPressed: () {},
        ),
      ],
    );
  }
}
