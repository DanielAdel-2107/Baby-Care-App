import 'package:baby_care/features/baby_sitter/my_requests/views/widgets/custom_requests_list.dart';
import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:flutter/material.dart';

class RequestsTabBarView extends StatelessWidget {
  const RequestsTabBarView({
    super.key,
    required this.pindingRequests,
    required this.acceptedRequests,
    required this.rejectedRequests,
  });
  final List<RequestModel> pindingRequests;
  final List<RequestModel> acceptedRequests;
  final List<RequestModel> rejectedRequests;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          CustomRequestList(
            requests: pindingRequests,
          ),
          CustomRequestList(
            requests: acceptedRequests,
          ),
          CustomRequestList(
            requests: rejectedRequests,
          ),
        ],
      ),
    );
  }
}
