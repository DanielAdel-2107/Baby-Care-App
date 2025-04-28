import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/helper/open_dialog.dart';
import 'package:baby_care/core/helper/show_custom_dialog.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/view_models/cubit/add_baby_sitter_request_cubit.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/book_and_cancel_button.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/book_baby_sitter_screen_form.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/book_baby_sitter_screen_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBabySitterScreenBody extends StatelessWidget {
  const BookBabySitterScreenBody(
      {super.key, required this.id, required this.image});
  final String id;
  final String image;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBabySitterRequestCubit(),
      child: BlocConsumer<AddBabySitterRequestCubit, AddBabySitterRequestState>(
        listener: (context, state) {
          if (state is AddBabySitterRequestSuccess) {
            successDialog(context);

            //   showCustomDialog(
            //       title: "Success",
            //       description: "Request Sent",
            //       dialogType: DialogType.success);
          }
          if (state is AddBabySitterRequestFailure) {
            showCustomDialog(
                title: "Failure",
                description: state.errorMessage,
                dialogType: DialogType.error);
          }
          if (state is AddBabySitterRequestFieldsRequired) {
            showCustomDialog(
                title: "Info",
                description: "Please, Fill all fields",
                dialogType: DialogType.info);
          }
        },
        builder: (context, state) {
          var cubit = context.read<AddBabySitterRequestCubit>();
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookBabySitterScreenTitle(),
                      BookBabySitterForm(
                        image: image,
                        cubit: cubit,
                      ),
                    ],
                  ),
                ),
                BookAndCancelButton(
                  onPressed: () => cubit.addRequest(babySitterId: id),
                  isLoading: state is AddBabySitterRequestLoading,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> successDialog(BuildContext context) {
    return openDialog(
      context: context,
      widget: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.screenHeight * 0.02,
              vertical: context.screenHeight * 0.01),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Request Sent Successfully",
                textAlign: TextAlign.center,
                style: AppTextStyles.title20PrimaryColorW500,
              ),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              CustomElevatedButton(
                name: "Chat With Baby Sitter",
                width: context.screenWidth * 0.8,
                height: context.screenHeight * 0.05,
                onPressed: () {
                  context.pushScreen(RouteNames.chatScreen,
                      arguments:
                          context.read<AddBabySitterRequestCubit>().requestId);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              CustomElevatedButton(
                name: "Go To Home",
                width: context.screenWidth * 0.8,
                height: context.screenHeight * 0.05,
                onPressed: () {
                  context.pushScreen(RouteNames.parentHomeScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
