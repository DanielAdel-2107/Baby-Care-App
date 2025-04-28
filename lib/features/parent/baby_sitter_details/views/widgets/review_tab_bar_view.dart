import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/custom_review_card.dart';
import 'package:flutter/material.dart';

class ReviewsTabBarView extends StatelessWidget {
  const ReviewsTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomReviewCard();
      },
    );
  }
}
