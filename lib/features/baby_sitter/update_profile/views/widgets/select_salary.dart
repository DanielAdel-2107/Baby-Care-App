import 'package:baby_care/core/components/custom_drop_down_button_form_field.dart';
import 'package:baby_care/core/components/custom_text_form_field.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SelectSalary extends StatelessWidget {
  const SelectSalary({
    super.key,
    required this.salaryController,
    required this.currencyController,
    required this.perTimeController,
  });
  final TextEditingController salaryController,
      currencyController,
      perTimeController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.screenHeight * 0.003,
      children: [
        
        Text(
          "Select your salary",
          style: AppTextStyles.title20PrimaryColorW500,
        ),
        CustomTextFormField(
          hintText: "salary",
          fillColor: Colors.grey.withOpacity(0.2),
          controller: salaryController,
        ),
        SizedBox(height: context.screenHeight * 0.003),
        Row(
          spacing: context.screenWidth * 0.01,
          children: [
            Expanded(
              child: CustomDropDownButtonFormField(
                hintText: "per hour",
                userRoles: [
                  "per hour",
                  "per day",
                  "per week",
                  "per month",
                ],
                controller: perTimeController,
              ),
            ),
            Expanded(
              child: CustomDropDownButtonFormField(
                hintText: "USD",
                userRoles: [
                  "EUR",
                  "EGP",
                  "USD",
                  "SAR",
                ],
                controller: currencyController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
