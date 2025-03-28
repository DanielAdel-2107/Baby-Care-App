import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/features/baby_sitter/my_requests/views/widgets/request_list_tile.dart';
import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:flutter/material.dart';

class CustomParentRequestList extends StatelessWidget {
  const CustomParentRequestList({
    super.key,
    required this.requests,
  });
  final List<RequestModel> requests;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: context.screenHeight * 0.015,
        children: List.generate(
          requests.length,
          (index) => RequestListTile(
            requestModel: requests[index],
            enableChat: requests[index].status != "Rejected",
            onTap: () {
              context.pushScreen(
                RouteNames.chatScreen,
                arguments: requests[index].id,
              );
            },
          ),
        ),
      ),
    );
  }
}
