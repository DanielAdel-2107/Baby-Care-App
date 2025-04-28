import 'package:baby_care/core/components/custom_icon_button.dart';
import 'package:baby_care/core/utilies/assets/images/app_images.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:flutter/material.dart';

class RequestListTile extends StatelessWidget {
  const RequestListTile({
    super.key,
    this.enableChat = true,
    required this.requestModel,
    this.onTap,
    this.onLongPress,
  });
  final RequestModel requestModel;
  final bool enableChat;
  final Function()? onTap;
  final Function()? onLongPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.screenHeight * 0.01,
      ),
      child: ListTile(
        onTap: enableChat ? onTap : null,
        onLongPress: onLongPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.kLightPrimaryColor, width: 2),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(AppImages.bookBabySitter),
        ),
        title: Text(requestModel.address),
        subtitle: Text(
          "${requestModel.date} ${requestModel.time}",
          style: AppTextStyles.title16GreyW500,
        ),
        trailing: enableChat
            ? CustomIconButton(
                icon: Icons.chat,
                iconColor: AppColors.kPrimaryColor,
                onPressed: () {},
                iconSize: context.screenWidth * 0.07,
              )
            : null,
      ),
    );
  }
}
