import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baby_care/core/helper/show_custom_dialog.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/auth/sign_in/views/widgets/custom_auth_app_bar.dart';
import 'package:baby_care/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:baby_care/features/auth/sign_up/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => SignUpCubit(),
          child: BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                context.popScreen();
                showCustomDialog(
                    title: "Success",
                    description: "Sign Up Successfully",
                    dialogType: DialogType.success);
              }
              if (state is SignUpFailure) {
                showCustomDialog(
                    title: "Failure",
                    description: state.errorMessage,
                    dialogType: DialogType.error);
              }
              if (state is SignUpFieldsRequired) {
                showCustomDialog(
                  title: "Info",
                  description: "Please fill all fields",
                  dialogType: DialogType.info,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: context.signUpCubit.formKey,
                child: Column(
                  children: [
                    CustomAuthAppBar(
                      title: "Find A Child Card",
                      subtitle: "fill in your details to begin a member",
                    ),
                    SignUpForm()
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
