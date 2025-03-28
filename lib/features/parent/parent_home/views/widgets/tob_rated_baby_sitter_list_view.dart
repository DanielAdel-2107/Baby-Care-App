import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:baby_care/features/parent/parent_home/view_models/cubit/get_baby_sitter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedBabySitterListView extends StatelessWidget {
  const TopRatedBabySitterListView({
    super.key,
    required this.babySitterList,
  });
  final List<BabySitterModel> babySitterList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  height: context.screenHeight * 0.1,

      child: BlocBuilder<GetBabySitterCubit, GetBabySitterState>(
        builder: (context, state) {
          if (state is GetBabySitterLoading) {
            return Center(child: CircularProgressIndicator(
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
            itemCount: babySitterList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.05),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pink, width: 3),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(babySitterList[index].image),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
