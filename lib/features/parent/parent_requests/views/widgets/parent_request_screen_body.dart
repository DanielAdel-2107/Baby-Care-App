import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/baby_sitter/my_requests/views/widgets/requests_tab_bar.dart';
import 'package:baby_care/features/baby_sitter/my_requests/views/widgets/requests_title.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/update_profile_screen_body.dart';
import 'package:baby_care/features/parent/parent_requests/view_models/cubit/parent_request_cubit.dart';
import 'package:baby_care/features/parent/parent_requests/views/widgets/parent_requests_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParentRequestsScreenBody extends StatelessWidget {
  const ParentRequestsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentRequestCubit(),
      child: BlocBuilder<ParentRequestCubit, ParentRequestState>(
        builder: (context, state) {
          if (state is ParentRequestLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              ),
            );
          }
          if (state is ParentRequestFailed) {
            return Center(
              child: Text(
                state.error,
                style: AppTextStyles.title24PrimaryColorBold,
              ),
            );
          }
          var cubit = context.read<ParentRequestCubit>();
          return DefaultTabController(
            length: 3,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  top: context.screenHeight * 0.02,
                  left: context.screenWidth * 0.05,
                  right: context.screenWidth * 0.05,
                ),
                child: Column(
                  children: [
                    RequestsTitle(),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    RequestsTabBar(),
                    CustomDivider(),
                    ParentRequestsTabBarView(
                      acceptedRequests: cubit.acceptedRequests,
                      pindingRequests: cubit.pindingRequests,
                      rejectedRequests: cubit.rejectedRequests,
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
