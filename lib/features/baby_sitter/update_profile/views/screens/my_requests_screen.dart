import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/update_profile_screen_body.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: UpdateProfileScreenBody(),
      ),
    );
  }
}





