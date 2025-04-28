import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:baby_care/features/parent/parent_requests/views/widgets/custom_parent_request.dart';
import 'package:flutter/material.dart';

class ParentRequestsTabBarView extends StatelessWidget {
  const ParentRequestsTabBarView({
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
          CustomParentRequestList(
            requests: pindingRequests,
          ),
          CustomParentRequestList(
            requests: acceptedRequests,
          ),
          CustomParentRequestList(
            requests: rejectedRequests,
          ),
        ],
      ),
    );
  }
}
