import 'package:baby_care/features/parent/parent_home/views/widgets/custom_parent_speed_dial.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/parent_home_screen_body.dart';
import 'package:flutter/material.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParentHomeScreenBody(),
      floatingActionButton:CustomParentSpeedDial()
    );
  }
}
