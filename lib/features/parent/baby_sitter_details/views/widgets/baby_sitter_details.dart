import 'package:baby_care/core/components/custom_elevavted_button_with_title.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/custom_row_lable.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/custom_row_lable_text.dart';
import 'package:flutter/material.dart';

class BabySitterDetails extends StatelessWidget {
  const BabySitterDetails({
    super.key, required this.locationName, required this.salary, required this.babySitterName,
  });
  final String babySitterName;
  final String locationName;
  final String salary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.58,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                babySitterName,
                style: AppTextStyles.title20PrimaryColorW500,
              ),
              Spacer(),
              ...List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: context.screenWidth * 0.032,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomRowLable(
                    icon: Icons.location_on_outlined,
                    label: locationName.split(" ").first,
                  ),
                  CustomRowLabelText(
                    lable: "$salary\$",
                    value: "/ hr",
                  ),
                ],
              ),
              Spacer(),
              CustomElevatedButtonWithIcon(
                title: "Call",
                onPressed: () {},
                height: context.screenHeight * 0.05,
                width: context.screenWidth * 0.28,
                icon: Icons.phone,
                backgroundColor: Colors.green,
                iconAlignment: IconAlignment.start,
              ),
            ],
          ),
          CustomRowLable(
            label: "1.2 k",
            icon: Icons.favorite,
            iconColor: Colors.red,
          )
        ],
      ),
    );
  }
}
