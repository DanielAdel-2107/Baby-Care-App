import 'package:baby_care/features/parent/parent_requests/views/widgets/parent_request_screen_body.dart';
import 'package:flutter/material.dart';

class ParentRequetsScreen extends StatelessWidget {
  const ParentRequetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParentRequestsScreenBody(),
    );
  }
}
