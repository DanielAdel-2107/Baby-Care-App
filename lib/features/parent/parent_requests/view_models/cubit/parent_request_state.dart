part of 'parent_request_cubit.dart';

sealed class ParentRequestState {}

final class ParentRequestInitial extends ParentRequestState {}
final class ParentRequestLoading extends ParentRequestState {}
final class ParentRequestSuccess extends ParentRequestState {}
final class ParentRequestFailed extends ParentRequestState {
  final String error;

  ParentRequestFailed({required this.error});
}
final class ParentRequestEmpty extends ParentRequestState {}
