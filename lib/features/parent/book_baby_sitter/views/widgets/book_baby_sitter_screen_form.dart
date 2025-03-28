import 'package:baby_care/core/components/custom_text_form_field.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/view_models/cubit/add_baby_sitter_request_cubit.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/add_child.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/custom_book_baby_sitter_field.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/custom_calendar.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/custom_toggel_swith_button.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/positioned_baby_sitter_image.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/select_location.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/select_time_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookBabySitterForm extends StatelessWidget {
  const BookBabySitterForm({
    super.key,
    required this.image,
    required this.cubit,
  });
  final String image;
  final AddBabySitterRequestCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBabySitterRequestCubit, AddBabySitterRequestState>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.only(
                  top: context.screenWidth * 0.07,
                  left: context.screenWidth * 0.05,
                  right: context.screenWidth * 0.05,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.screenWidth * 0.15),
                  ),
                  color: AppColors.kLightPrimaryColor.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Date",
                      style: AppTextStyles.title24PrimaryColorBold,
                    ),
                    CustomToggelSwithButton(),
                    SizedBox(
                      height: context.screenHeight * 0.01,
                    ),
                    CustomCalendar(
                      onpressed: (time) {
                         cubit.selectDate(DateFormat("yyyy-MM-dd").format(time));
                      },
                    ),
                    Text(
                      "Select Time",
                      style: AppTextStyles.title24PrimaryColorBold,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.015,
                    ),
                    SelectTimeListView(
                      cubit: cubit,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    CustomBookBabySitterField(
                      title: "From",
                      icon: Icons.access_time,
                      value: cubit.startTime ?? "--:--",
                      onPressed: () {
                        cubit.pickTime(context: context, isStartTime: true);
                      },
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.007,
                    ),
                    CustomBookBabySitterField(
                      icon: Icons.access_time,
                      title: "To",
                      value: cubit.endTime ?? "--:--",
                      onPressed: () {
                        cubit.pickTime(context: context, isStartTime: false);
                      },
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    AddChild(cubit: cubit),
                    SelectLocation(cubit: cubit),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    Text(
                      "Note",
                      style: AppTextStyles.title24PrimaryColorBold,
                    ),
                    CustomTextFormField(
                      hintText: "enter your note",
                      maxline: 3,
                      controller: cubit.noteController,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.15,
                    ),
                  ],
                ),
              ),
            ),
            PositionedBabySitterImage(
              image: image,
            ),
          ],
        );
      },
    );
  }
}
