import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/baby_sitter/update_profile/view_models/cubit/update_profile_cubit.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/update_profile_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
    this.onPressed,
    required this.getlocation,
  });
  final Function()? onPressed;
  final bool getlocation;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select Location",
              style: AppTextStyles.title20PrimaryColorW500,
            ),
            state is SelectLocationLoading
                ? CustomLoading()
                : getlocation
                    ? Text(
                        "Location Selected",
                        style: AppTextStyles.title18Black54,
                      )
                    : CustomTextButton(
                        title: "Select 📍",
                        onPressed: onPressed,
                        alignment: Alignment.center,
                      ),
          ],
        );
      },
    );
  }
}
