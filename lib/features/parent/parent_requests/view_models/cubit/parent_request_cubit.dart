import 'dart:async';
import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:baby_care/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'parent_request_state.dart';

class ParentRequestCubit extends Cubit<ParentRequestState> {
  ParentRequestCubit() : super(ParentRequestLoading()) {
    getParentRequests();
  }
  List<RequestModel> pindingRequests = [];
  List<RequestModel> acceptedRequests = [];
  List<RequestModel> rejectedRequests = [];
  StreamSubscription? _streamSubscription;
  getParentRequests() {
    _streamSubscription = streamDataWithSpecificId(
      tableName: "requests",
      id: getIt<SupabaseClient>().auth.currentUser!.id,
      primaryKey: "parent_id",
    ).listen(
      (data) {
        if (data.isNotEmpty) {
          List<RequestModel> allRequests =
              data.map((m) => RequestModel.fromJson(m)).toList();
          pindingRequests =
              allRequests.where((req) => req.status == "Pending").toList();
          acceptedRequests =
              allRequests.where((req) => req.status == "Accepted").toList();
          rejectedRequests =
              allRequests.where((req) => req.status == "Rejected").toList();
          emit(ParentRequestSuccess());
        } else {
          emit(ParentRequestEmpty());
        }
      },
      onError: (e) {
        emit(ParentRequestFailed(error: e.toString()));
      },
    );
  }
}
