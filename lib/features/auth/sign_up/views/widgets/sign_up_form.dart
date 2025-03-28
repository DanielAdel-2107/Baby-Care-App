import 'package:baby_care/core/components/custom_drop_down_button_form_field.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/components/custom_text_form_field_with_title.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/social_auth_and_privacy_text.dart';
import 'package:baby_care/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(
          bottom: context.screenHeight * 0.01,
          top: context.screenHeight * 0.05,
          left: context.screenWidth * 0.05,
          right: context.screenWidth * 0.05,
        ),
        decoration: BoxDecoration(
          color: AppColors.kLightPrimaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
          ),
        ),
        child: Column(
          children: [
            CustomTextFormFieldWithTitle(
              hintText: "Full Name",
              controller: context.signUpCubit.fullNameController,
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            CustomTextFormFieldWithTitle(
              hintText: "E-mail",
              controller: context.signUpCubit.emailController,
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            CustomDropDownButtonFormField(
              userRoles: ["parent", "Baby Sitter"],
              controller: context.signUpCubit.roleController,
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            CustomTextFormFieldWithTitle(
              hintText: "Password",
              isPassword: true,
              controller: context.signUpCubit.passwordController,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                return state is SignUpLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              height: context.screenHeight * 0.07,
                              name: "Sign Up",
                              backgroundColor: AppColors.kPrimaryColor,
                              onPressed: () {
                                context.signUpCubit.signUp();
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
            HaveAccountOrNot(
              btnName: "Sign In",
              title: "Already a member?",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SocialAuthAndPrivacyText()
          ],
        ),
      ),
    );
  }
}
