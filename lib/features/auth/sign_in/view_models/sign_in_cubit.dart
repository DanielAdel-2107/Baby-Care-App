import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:baby_care/core/network/supabase/auth/sign_in_with_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final supabase = getIt<SupabaseClient>();
  String route = "";
  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignInLoading());
        await signInWithPassword(
            email: emailController.text, password: passwordController.text);
        emit(SignInSuccess(routeName: await getHomeScreen()));
      } on Exception catch (e) {
        emit(SignInFailure(errorMessage: e.toString()));
      }
    }
  }

  Future<String> getHomeScreen() async {
    var data = await getIt<SupabaseClient>()
        .from("users")
        .select()
        .eq("id", getIt<SupabaseClient>().auth.currentUser!.id)
        .single();
    // user = UserModel.fromJson(data);
    // await getIt<CacheHelper>().saveUserModel(user!);
    if (data["role"] == "parent") {
      return RouteNames.parentHomeScreen;
    } else {
      if (data["complete_profile"] == true) {
        return RouteNames.myRequestsScreen;
      }
      else{
        return RouteNames.updateProfileScreen;
      }
    }
  }
}
