part of 'my_requests_cubit.dart';

@immutable
sealed class MyRequestsState {}

final class MyRequestsInitial extends MyRequestsState {}

final class MyRequestsSuccess extends MyRequestsState {}

final class MyRequestsFailure extends MyRequestsState {
  final String error;

  MyRequestsFailure({required this.error});
}

final class MyRequestsLoading extends MyRequestsState {}

final class MyRequestsEmpty extends MyRequestsState {}
//! change request state
final class ChangeRequestLoading extends MyRequestsState {}
final class ChangeRequestSuccess extends MyRequestsState {}
final class ChangeRequestFailure extends MyRequestsState {
  final String error;

  ChangeRequestFailure({required this.error});
}
