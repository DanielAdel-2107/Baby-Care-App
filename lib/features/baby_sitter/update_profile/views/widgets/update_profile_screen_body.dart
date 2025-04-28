import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/helper/show_custom_dialog.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/baby_sitter/update_profile/view_models/cubit/update_profile_cubit.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/pick_image.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/select_location.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/select_salary.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/widgets/update_profile_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreenBody extends StatelessWidget {
  const UpdateProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
        vertical: context.screenHeight * 0.005,
      ),
      child: BlocProvider(
        create: (context) => UpdateProfileCubit(),
        child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              context.pushReplacementScreen(RouteNames.myRequestsScreen);
              showCustomDialog(
                  title: "Success",
                  description: "Updated Successfully",
                  dialogType: DialogType.success);
            }
            if (state is UpdateProfileFailure) {
              showCustomDialog(
                  title: "Failure",
                  description: state.errorMessage,
                  dialogType: DialogType.error);
            }
            if (state is UpdateProfileFieldsEmpty) {
              showCustomDialog(
                  title: "Hint",
                  description: "Please Fill All Fields",
                  dialogType: DialogType.info);
            }
            if (state is LocationRequired) {
              showCustomDialog(
                  title: "Info",
                  description: "Location Is Required",
                  dialogType: DialogType.info);
            }
            if (state is SelectLocationFailure) {
              showCustomDialog(
                  title: "Failure",
                  description: state.errorMessage,
                  dialogType: DialogType.error);
            }
          },
          builder: (context, state) {
            var cubit = context.read<UpdateProfileCubit>();
            return SingleChildScrollView(
              child: Column(
                children: [
                  state is UploadImageLoading
                      ? CustomLoading()
                      : PickImage(
                          file: cubit.file,
                          onPressed: () {
                            cubit.pickImage();
                          },
                        ),
                  SizedBox(
                    height: context.screenHeight * 0.04,
                  ),
                  UpdateProfileFields(
                    nameController: cubit.nameController,
                    ageController: cubit.ageController,
                    experianceController: cubit.experienceController,
                    aboutMeController: cubit.aboutMeController,
                    formKey: cubit.formKey,
                  ),
                  CustomDivider(),
                  SelectLocation(
                    onPressed: () async {
                      await cubit.pickLocation();
                    },
                    getlocation: cubit.position != null,
                  ),
                  CustomDivider(),
                  SelectSalary(
                    currencyController: cubit.currencyController,
                    perTimeController: cubit.perTimeController,
                    salaryController: cubit.salaryController,
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.04,
                  ),
                  state is UpdateProfileLoading
                      ? CustomLoading()
                      : CustomElevatedButton(
                          name: "Update Profile",
                          width: context.screenWidth * 0.9,
                          height: context.screenHeight * 0.07,
                          onPressed: () {
                            cubit.updateProfile();
                          },
                        ),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: AppColors.kPrimaryColor,
    ));
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
      ),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}
