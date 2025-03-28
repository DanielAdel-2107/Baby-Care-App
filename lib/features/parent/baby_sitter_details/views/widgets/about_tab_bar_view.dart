import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/custom_column_lable.dart';
import 'package:flutter/material.dart';

class AboutTabBarView extends StatelessWidget {
  const AboutTabBarView({
    super.key,
    required this.aboutMe,
  });
  final String aboutMe;
  @override
  Widget build(BuildContext context) {
    return CustomColumnLable(
      lable: "About",
      value: aboutMe,
    );
  }
}
