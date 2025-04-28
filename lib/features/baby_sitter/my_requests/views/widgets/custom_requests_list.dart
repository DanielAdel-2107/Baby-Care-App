import 'package:baby_care/core/app_route/route_names.dart';
import 'package:baby_care/core/utilies/colors/app_colors.dart';
import 'package:baby_care/core/utilies/extensions/app_extensions.dart';
import 'package:baby_care/core/utilies/styles/app_text_styles.dart';
import 'package:baby_care/features/baby_sitter/my_requests/view_models/cubit/my_requests_cubit.dart';
import 'package:baby_care/features/baby_sitter/my_requests/views/widgets/request_list_tile.dart';
import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRequestList extends StatelessWidget {
  const CustomRequestList({
    super.key,
    required this.requests,
  });

  final List<RequestModel> requests;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestsCubit, MyRequestsState>(
      builder: (context, state) {
        if (state is ChangeRequestLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.kPrimaryColor,
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: requests.isEmpty
                ? [
                    Center(
                      child: Text(
                        'No requests found',
                        style: AppTextStyles.title24PrimaryColorBold,
                      ),
                    ),
                  ]
                : List.generate(
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
                      onLongPress: () {
                        _showOptionsBottomSheet(
                          context: context,
                          request: requests[index],
                          onAccept: () {
                            context.read<MyRequestsCubit>().changeRequestState(
                                  id: requests[index].id,
                                  status: "Accepted",
                                );
                            context.popScreen();
                          },
                          onReject: () {
                            context.read<MyRequestsCubit>().changeRequestState(
                                  id: requests[index].id,
                                  status: "Rejected",
                                );
                            context.popScreen();
                          },
                        );
                      },
                    ),
                  ),
          ),
        );
      },
    );
  }

  void _showOptionsBottomSheet({
    required BuildContext context,
    required RequestModel request,
    final Function()? onAccept,
    final Function()? onReject,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.check, color: Colors.green),
              title: Text('Accept Request'),
              onTap: () {
                onAccept!();
              },
            ),
            ListTile(
              leading: Icon(Icons.cancel, color: Colors.red),
              title: Text('Reject Request'),
              onTap: () {
                onReject!();
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.blue),
              title: Text('View Details'),
              onTap: () {},
            ),
          ],
        );
      },
    );
  }
}
