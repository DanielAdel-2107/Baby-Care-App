import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/features/parent/book_baby_sitter/views/widgets/book_baby_sitters_screen_body.dart';
import 'package:flutter/material.dart';

class BookBabySitterScreen extends StatelessWidget {
  const BookBabySitterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: AppColors.kLightPrimaryColor.withOpacity(0.2),
      body: BookBabySitterScreenBody(
        id: args?['id'],
        image: args?['image'],
      ),
    );
  }
}
