import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/about_tab_bar_view.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/location_tab_bar_view.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/photos_tab_bar_view.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/review_tab_bar_view.dart';
import 'package:flutter/material.dart';

class BabySitterDetailsTabBarView extends StatelessWidget {
  const BabySitterDetailsTabBarView({
    super.key, required this.aboutMe, required this.locationName,
  });
  final String aboutMe , locationName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
        vertical: MediaQuery.of(context).size.height * 0.03,
      ),
      child: TabBarView(
        children: [
          AboutTabBarView(
            aboutMe: aboutMe,
          ),
          PhotosTabBarView(),
          LocationTabBarView(
            locationName: locationName,
          ),
          ReviewsTabBarView()
        ],
      ),
    );
  }
}
