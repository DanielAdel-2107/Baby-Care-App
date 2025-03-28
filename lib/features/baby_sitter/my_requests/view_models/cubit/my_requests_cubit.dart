import 'dart:async';
import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:baby_care/core/network/supabase/database/stream_data_with_spacific.dart';
import 'package:baby_care/features/parent/parent_requests/models/request_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'my_requests_state.dart';

class MyRequestsCubit extends Cubit<MyRequestsState> {
  MyRequestsCubit() : super(MyRequestsLoading()) {
    getMyRequests();
  }
  List<RequestModel> pindingRequests = [];
  List<RequestModel> acceptedRequests = [];
  List<RequestModel> rejectedRequests = [];
  StreamSubscription? _streamSubscription;
  getMyRequests() {
    _streamSubscription = streamDataWithSpecificId(
      tableName: "requests",
      id: getIt<SupabaseClient>().auth.currentUser!.id,
      primaryKey: "baby_sitter_id",
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
          emit(MyRequestsSuccess());
        } else {
          emit(MyRequestsEmpty());
        }
      },
      onError: (e) {
        emit(MyRequestsFailure(error: e.toString()));
      },
    );
  }

  changeRequestState({required String id, required String status}) async {
    try {
      emit(ChangeRequestLoading());
      await getIt<SupabaseClient>().from("requests").update(
        {"status": status},
      ).eq("id", id);
      emit(ChangeRequestSuccess());
    } on Exception catch (e) {
      emit(
        ChangeRequestFailure(
          error: e.toString(),
        ),
      );
    }
  }
}
