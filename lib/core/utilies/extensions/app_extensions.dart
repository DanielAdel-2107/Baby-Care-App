import 'package:baby_care/app/my_app.dart';
import 'package:baby_care/features/auth/forget_password/view_models/forget_password_cubit.dart';
import 'package:baby_care/features/auth/sign_in/view_models/sign_in_cubit.dart';
import 'package:baby_care/features/auth/sign_up/view_models/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AppExtensions on BuildContext {
  //features/auth/cubit
  SignUpCubit get signUpCubit => read<SignUpCubit>();
  SignInCubit get signInCubit => read<SignInCubit>();
  double get screenWidth => MediaQuery.of(navigatorKey.currentContext!).size.width;
  double get screenHeight => MediaQuery.of(navigatorKey.currentContext!).size.height;
  ForgetPasswordCubit get forgetPasswordCubit => read<ForgetPasswordCubit>();

  // navigation
  void pushScreen(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementScreen(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pushAndRemoveUntilScreen(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void popScreen() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popWithResult<T>(T result) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop(result);
    }
  }

  bool canPopScreen() {
    return Navigator.of(this).canPop();
  }
}
