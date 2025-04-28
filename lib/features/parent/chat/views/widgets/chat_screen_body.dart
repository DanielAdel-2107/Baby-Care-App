import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/chat/veiw_models/cubit/chat_cubit.dart';
import 'package:baby_care/features/parent/chat/views/widgets/messages_list_view.dart';
import 'package:baby_care/features/parent/chat/views/widgets/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreenBody extends StatelessWidget {
  const ChatScreenBody({
    super.key, required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            ChatCubit(id: id),
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is ChatLoaded) {
              var cubit = context.read<ChatCubit>();
              return Column(
                children: [
                  MessagesListView(
                    messages: state.messages,
                  ),
                  SendMessage(
                    controller: cubit.messageController,
                    onPressed: () => cubit.addMessage(),
                  ),
                ],
              );
            }
            if (state is ChatLoading) {
              return Center(
                  child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              ));
            }
            return Center(
              child: Text(
                "Failed to load chat data",
                style: AppTextStyles.title24PrimaryColorBold,
              ),
            );
          },
        ),
      ),
    );
  }
}
