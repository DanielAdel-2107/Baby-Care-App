import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/view_models/cubit/add_baby_sitter_request_cubit.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/custom_book_baby_sitter_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
    required this.cubit,
  });

  final AddBabySitterRequestCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBabySitterRequestCubit, AddBabySitterRequestState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address",
              style: AppTextStyles.title24PrimaryColorBold,
            ),
            CustomBookBabySitterField(
              icon: Icons.location_on_outlined,
              loading: state is SelectLocationLoading,
              value: cubit.locationName,
              title: "Current Location",
            ),
            CustomTextButton(
              title: "Select Location",
              onPressed: () {
                cubit.getCurrentLocationName();
              },
            ),
          ],
        );
      },
    );
  }
}
