import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baby_care/core/helper/show_custom_dialog.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/custom_auth_app_bar.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInSuccess) {
              context.pushScreen(state.routeName);
              showCustomDialog(
                title: "Success",
                description: "Sign In Successfully",
                dialogType: DialogType.success,
              );
            }
            if (state is SignInFailure) {
              showCustomDialog(
                  title: "Failure",
                  description: state.errorMessage,
                  dialogType: DialogType.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: context.signInCubit.formKey,
                child: Column(
                  children: [
                    CustomAuthAppBar(
                        title: "Welcome Back",
                        subtitle: "Sign in with your account"),
                    SignInForm(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
