import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/chat/models/message_model.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.messages,
  });
  final List<ChatMessage> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: messages.isEmpty
          ? Center(
              child: Text(
                "No messages yet",
                style: AppTextStyles.title24PrimaryColorBold,
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: context.screenHeight * 0.01,
              ),
              itemCount: messages.length,
              itemBuilder: (context, index) => BubbleSpecialThree(
                text: messages[index].message,
                color: getIt<SupabaseClient>().auth.currentUser!.id ==
                        messages[index].id
                    ? AppColors.kPrimaryColor
                    : AppColors.kSecondColor,
                tail: true,
                isSender: getIt<SupabaseClient>().auth.currentUser!.id ==
                    messages[index].id,
                textStyle: getIt<SupabaseClient>().auth.currentUser!.id ==
                        messages[index].id
                    ? AppTextStyles.title18White
                    : AppTextStyles.title18White,
              ),
            ),
    );
  }
}
