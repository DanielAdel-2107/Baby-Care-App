import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/components/custom_text_form_field.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/parent/chat_with_ai/models/chat_message.dart';
import 'package:baby_care/features/parent/chat_with_ai/view_models/cubit/chat_cubit.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeminiChatScreenBody extends StatelessWidget {
  const GeminiChatScreenBody({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatGeminiCubit, List<ChatMessageGemini>>(
            builder: (context, messages) {
              return ListView.builder(
                padding: EdgeInsets.all(context.screenWidth * 0.01),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return message.sender == 'user'
                      ? BubbleSpecialOne(
                          text: message.text,
                          isSender: true,
                          color: AppColors.kLightPrimaryColor,
                        )
                      : BubbleSpecialOne(
                          text: message.text,
                          isSender: false,
                          color: Colors.grey.shade300,
                        );
                },
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.screenWidth * 0.05,
            vertical: context.screenHeight * 0.01,
          ),
          decoration: BoxDecoration(
            color: AppColors.kLightPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "Enter something...",
                  controller: _controller,
                ),
              ),
              SizedBox(width: context.screenWidth * 0.01),
              CustomIconButton(
                icon: Icons.send,
                iconSize: context.screenWidth * 0.07,
                onPressed: () {
                  context.read<ChatGeminiCubit>().sendMessage(_controller.text);
                  _controller.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
