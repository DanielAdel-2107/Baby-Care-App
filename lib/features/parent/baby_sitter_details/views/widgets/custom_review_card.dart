import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: context.screenWidth * 0.08,
              backgroundImage: AssetImage(
                AppImages.bookBabySitter,
              ),
            ),
            SizedBox(
              width: context.screenWidth * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Daniel Adel",
                  style: AppTextStyles.title20Black87W500,
                ),
                Row(
                  children: [
                    ...List.generate(
                      3,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: context.screenWidth * 0.032,
                      ),
                    ),
                    ...List.generate(
                      2,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.grey.shade400,
                        size: context.screenWidth * 0.032,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Text(
              "2 days ago",
              style: AppTextStyles.title18Black54WithOpacity,
            )
          ],
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.01,
          ),
          child: Text(
            "Loream ispam ispam ispam ispam ispam ispam is pam ispam ispam isp am ispam isp am ispam ispam ispam ispam ispam",
            style: AppTextStyles.title18Black54,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.screenHeight * 0.02,
              horizontal: context.screenWidth * 0.1),
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
