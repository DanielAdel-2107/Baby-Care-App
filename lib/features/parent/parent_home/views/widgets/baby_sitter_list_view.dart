import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/parent_home/view_models/cubit/get_baby_sitter_cubit.dart';
import 'package:baby_care/features/parent/parent_home/views/widgets/custom_baby_sitter_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BabySittersListView extends StatefulWidget {
  const BabySittersListView({
    super.key,
    required this.cubit,
  });

  final GetBabySitterCubit cubit;

  @override
  State<BabySittersListView> createState() => _BabySittersListViewState();
}

class _BabySittersListViewState extends State<BabySittersListView> {
  int expandedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.screenHeight * 0.05,
        bottom: context.screenHeight * 0.01,
      ),
      child: SizedBox(
        height: context.screenHeight * 0.31,
        child: BlocBuilder<GetBabySitterCubit, GetBabySitterState>(
          builder: (context, state) {
            if (state is GetBabySitterLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              ));
            }
            if (state is GetBabySitterEmpty) {
              return Center(
                child: Text('No baby sitters available',
                    style: AppTextStyles.title24PrimaryColorBold),
              );
            }
            if (state is GetBabySitterFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: AppTextStyles.title24PrimaryColorBold,
                ),
              );
            }
            return ListView.builder(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: widget.cubit.nearestBabySitterList.length,
              itemBuilder: (context, index) {
                bool isExpanded = expandedIndex == index;
                return CustomBabySitterCard(
                  isExpanded: isExpanded,
                  babySitterModel: widget.cubit.nearestBabySitterList[index],
                  onTap: () {
                    setState(
                      () {
                        expandedIndex = isExpanded ? -1 : index;
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
