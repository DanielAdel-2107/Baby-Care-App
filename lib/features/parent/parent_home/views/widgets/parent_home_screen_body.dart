import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/components/custom_text_form_field.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/widgets/custom_title_and_show_more.dart';
import 'package:baby_care/features/parent/parent_home/view_models/cubit/get_baby_sitter_cubit.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/baby_sitter_list_view.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/custom_parent_home_screen_app_bar.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/tob_rated_baby_sitter_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentHomeScreenBody extends StatelessWidget {
  const ParentHomeScreenBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetBabySitterCubit(),
      child: BlocBuilder<GetBabySitterCubit, GetBabySitterState>(
        builder: (context, state) {
          var cubit = context.read<GetBabySitterCubit>();
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenWidth * 0.04,
                  vertical: context.screenHeight * 0.00,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomParentHomeScreenAppBar(),
                    Text(
                      "Find Babysitter",
                      style: AppTextStyles.title36PrimaryColorBold,
                    ),
                    Text(
                      "find a trusted babysitter near you",
                      style: AppTextStyles.title18Black,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    CustomTextFormField(
                      hintText: "find by location",
                      prefixIcon: Icon(Icons.location_on_outlined),
                      onChanged: (value) {
                        cubit.searchForPlace(place: value);
                      },
                      suffixIcon: CustomIconButton(
                        icon: Icons.mic_none_rounded,
                        iconColor: AppColors.kPrimaryColor,
                        iconSize: context.screenWidth * 0.07,
                        onPressed: () {},
                      ),
                    ),
                    BabySittersListView(
                      cubit: cubit,
                    ),
                    CustomTitleAndShowMore(
                      title: "Top Rated",
                    ),
                    TopRatedBabySitterListView(
                      babySitterList: cubit.allBabySittersList,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
