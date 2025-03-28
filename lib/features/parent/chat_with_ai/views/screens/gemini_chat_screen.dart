import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/features/parent/chat_with_ai/views/widgets/gemini_chat_sreen_body.dart';
import 'package:flutter/material.dart';

class GeminiChatScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  GeminiChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gemini Chat'),
        backgroundColor: AppColors.kLightPrimaryColor,
        foregroundColor: Colors.white,
      ),
      body: GeminiChatScreenBody(controller: _controller),
    );
  }
}

