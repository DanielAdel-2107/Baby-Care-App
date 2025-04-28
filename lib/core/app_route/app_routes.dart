import 'package:baby_care/features/auth/forget_password/views/screens/forget_password_screen.dart.dart';
import 'package:baby_care/features/auth/sign_in/views/screens/sign_in_screen.dart';
import 'package:baby_care/features/auth/sign_up/views/screens/sign_up_screen.dart';
import 'package:baby_care/features/baby_sitter/my_requests/views/screens/my_requests_screen.dart';
import 'package:baby_care/features/baby_sitter/update_profile/views/screens/my_requests_screen.dart';
import 'package:baby_care/features/parent/baby_sitter_details/views/screens/baby_sitter_details_screen.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/screens/book_baby_sitter_screen.dart';
import 'package:baby_care/features/parent/chat/views/screens/chat_screen.dart';
import 'package:baby_care/features/parent/chat_with_ai/view_models/cubit/chat_cubit.dart';
import 'package:baby_care/features/parent/chat_with_ai/views/screens/gemini_chat_screen.dart';
import 'package:baby_care/features/parent/parent_home/views/screens/parent_home_screen.dart';
import 'package:baby_care/features/parent/parent_requests/views/screens/parent_requets_screen.dart';
import 'package:baby_care/features/splash/on_boarding_screen/view/screens/on_boarding_screen.dart';
import 'package:baby_care/features/splash/splash_screen/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:baby_care/core/app_route/route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.forgetPasswordScreen: (context) => const ForgetPasswordScrren(),
    //
    RouteNames.parentHomeScreen: (context) => const ParentHomeScreen(),
    RouteNames.babySitterDetailsScreen: (context) =>
        const BabySitterDetailsScreen(),
    RouteNames.bookBabySitterScreen: (context) => const BookBabySitterScreen(),
    RouteNames.parentRequetsScreen: (context) => const ParentRequetsScreen(),
    RouteNames.geminiChatScreen: (context) => BlocProvider(
          create: (context) => ChatGeminiCubit(),
          child: GeminiChatScreen(),
        ),
    //
    RouteNames.updateProfileScreen: (context) => const UpdateProfileScreen(),
    RouteNames.myRequestsScreen: (context) => const MyRequestsScreen(),
    RouteNames.chatScreen: (context) => const ChatScreen(),
  };
}
