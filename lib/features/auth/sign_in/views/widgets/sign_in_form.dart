import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/components/custom_elevated_button.dart';
import 'package:baby_care/core/components/custom_text_form_field_with_title.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/forget_password.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/have_account_or_not.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/social_auth_and_privacy_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kLightPrimaryColor.withOpacity(0.4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(70),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: context.screenHeight * 0.05,
            left: context.screenWidth * 0.05,
            right: context.screenWidth * 0.05,
            bottom: context.screenHeight * 0.01,
          ),
          child: Column(
            children: [
              CustomTextFormFieldWithTitle(
                hintText: "E-mail",
                controller: context.signInCubit.emailController,
              ),
              SizedBox(height: context.screenHeight * 0.01),
              CustomTextFormFieldWithTitle(
                hintText: "Password",
                isPassword: true,
                controller: context.signInCubit.passwordController,
              ),
              SizedBox(height: context.screenHeight * 0.02),
              BlocBuilder<SignInCubit, SignInState>(
                builder: (context, state) {
                  return state is SignInLoading
                      ? Center(
                          child: CircularProgressIndicator(
                              color: AppColors.kPrimaryColor))
                      : Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                name: "Login",
                                width: double.infinity,
                                height: context.screenHeight * 0.07,
                                onPressed: () => context.signInCubit.signIn(),
                                backgroundColor: AppColors.kPrimaryColor,
                              ),
                            ),
                          ],
                        );
                },
              ),
              ForgetPassword(
                  onPressed: () =>
                      context.pushScreen(RouteNames.forgetPasswordScreen)),
              Text("Or", style: AppTextStyles.title18Black),
              SizedBox(height: context.screenHeight * 0.02),
              SocialAuthAndPrivacyText(),
              HaveAccountOrNot(
                title: "Dont have an account",
                btnName: "Sign Up",
                onPressed: () => context.pushScreen(RouteNames.signUpScreen),
              ),
              SizedBox(height: context.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
