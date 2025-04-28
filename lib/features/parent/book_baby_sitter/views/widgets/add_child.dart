import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/components/custom_text_button.dart';
import 'package:baby_care/core/components/custom_text_form_field_with_title.dart';
import 'package:baby_care/core/helper/open_dialog.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/book_baby_sitter/view_models/cubit/add_baby_sitter_request_cubit.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/child_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddChild extends StatelessWidget {
  const AddChild({
    super.key,
    required this.cubit,
  });

  final AddBabySitterRequestCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBabySitterRequestCubit, AddBabySitterRequestState>(
      listener: (context, state) {
        if (state is AddChildSuccess) {
          context.popScreen();
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Children",
              style: AppTextStyles.title24PrimaryColorBold,
            ),
            ChildrenFormField(
              icon: Icons.child_friendly_outlined,
              title: "Child 1",
              value: "child name , age",
              children: cubit.children,
            ),
            CustomTextButton(
              title: "+ Add a nother child",
              onPressed: () {
                addChildDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> addChildDialog(BuildContext context) {
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
                    child: Form(
                      key: cubit.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Enter Child Details",
                            style: AppTextStyles.title24PrimaryColorW500,
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.02,
                          ),
                          CustomTextFormFieldWithTitle(
                            title: "Child Name",
                            hintText: "enter child name",
                            controller: cubit.nameController,
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.01,
                          ),
                          CustomTextFormFieldWithTitle(
                            hintText: "enter child age",
                            title: "Child Age",
                            controller: cubit.ageController,
                          ),
                          SizedBox(
                            height: context.screenHeight * 0.03,
                          ),
                          CustomElevatedButton(
                            name: "Add",
                            width: context.screenWidth * 0.8,
                            height: context.screenHeight * 0.05,
                            onPressed: () {
                              cubit.addChild();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}
