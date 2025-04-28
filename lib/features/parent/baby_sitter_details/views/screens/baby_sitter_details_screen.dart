import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/baby_sitter_screen_body.dart';
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:flutter/material.dart';

class BabySitterDetailsScreen extends StatelessWidget {
  const BabySitterDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final babySitterModel = args != null
        ? BabySitterModel.fromJson(
            args,
            distance: args['distance'],
            locationName: args['location_name'],
          )
        : null;
    return Scaffold(
      body: BabySitterScreenBody(
        babySitterModel: babySitterModel!,
      ),
    );
  }
}
