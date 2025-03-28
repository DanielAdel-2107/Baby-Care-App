import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/chat/views/widgets/chat_screen_body.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.kLightPrimaryColor,
        title: Text(
          "Chat",
          style: AppTextStyles.title24WhiteW500,
        ),
      ),
      body: ChatScreenBody(
        id: args,
      ),
    );
  }
}
