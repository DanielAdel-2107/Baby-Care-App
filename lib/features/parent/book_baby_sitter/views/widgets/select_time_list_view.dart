import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/view_models/cubit/add_baby_sitter_request_cubit.dart';
import 'package:flutter/material.dart';

class SelectTimeListView extends StatelessWidget {
  const SelectTimeListView({
    super.key, required this.cubit
  });
  final AddBabySitterRequestCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.06,
      child: ListView.builder(
        itemCount: cubit.times.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            cubit.selectTime(index: index);
          },
          child: Container(
            margin: EdgeInsets.only(
              right: context.screenWidth * 0.02,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: cubit.times[index] != cubit.selectedTime
                    ? [
                        AppColors.kPrimaryColor.withOpacity(0.3),
                        AppColors.kSecondColor.withOpacity(0.3),
                      ]
                    : [AppColors.kPrimaryColor, AppColors.kPrimaryColor],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                cubit.times[index],
                style: AppTextStyles.title18White,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
