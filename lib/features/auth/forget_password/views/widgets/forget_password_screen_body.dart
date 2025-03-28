import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/components/custom_text_form_field_with_title.dart';
import 'package:baby_care/core/helper/show_custom_dialog.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/auth/forget_password/view_models/forget_password_cubit.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/custom_auth_app_bar.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/social_auth_and_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ForgetPasswordCubit(),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                context.popScreen();
                showCustomDialog(
                  title: "Password Reset",
                  description: "Check your email to reset your password",
                  dialogType: DialogType.success,
                );
              }
              if (state is ForgetPasswordFailure) {
                showCustomDialog(
                  title: "Failure",
                  description: state.errorMessage,
                  dialogType: DialogType.error,
                );
              }   
            },
            builder: (context, state) {
              return Form(
                key: context.forgetPasswordCubit.formKey,
                child: Column(
                  children: [
                    CustomAuthAppBar(
                        title: "Forget Password",
                        subtitle:
                            "Enter your email address to request a password reset"),
                    Container(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.only(
                          top: context.screenHeight * 0.05,
                          left: context.screenWidth * 0.05,
                          right: context.screenWidth * 0.05,
                          bottom: context.screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kLightPrimaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                          ),
                        ),
                        child: Column(
                          children: [
                            CustomTextFormFieldWithTitle(
                              hintText: "E-mail",
                              controller:
                                  context.forgetPasswordCubit.emailController,
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.05,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                    name: "Continue",
                                    height: context.screenHeight * 0.07,
                                    onPressed: () {
                                      context.forgetPasswordCubit
                                          .resetPassword();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: context.screenHeight * 0.02,
                            ),
                            Text("Or"),
                            SizedBox(
                              height: context.screenHeight * 0.02,
                            ),
                            SocialAuthAndPrivacyText()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
