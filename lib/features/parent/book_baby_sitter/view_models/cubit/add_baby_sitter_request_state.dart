part of 'add_baby_sitter_request_cubit.dart';

@immutable
sealed class AddBabySitterRequestState {}

final class AddBabySitterRequestInitial extends AddBabySitterRequestState {}

final class AddBabySitterRequestLoading extends AddBabySitterRequestState {}

final class AddBabySitterRequestSuccess extends AddBabySitterRequestState {}

final class AddBabySitterRequestFailure extends AddBabySitterRequestState {
  final String errorMessage;
  AddBabySitterRequestFailure({required this.errorMessage});
}

final class AddBabySitterRequestFieldsRequired
    extends AddBabySitterRequestState {}
//! location state
final class SelectLocationFailure extends AddBabySitterRequestState {
  final String errorMessage;
  SelectLocationFailure({required this.errorMessage});
}

final class SelectLocationLoading extends AddBabySitterRequestState {}

final class SelectLocationSuccess extends AddBabySitterRequestState {}
//! add child state
final class AddChildFailure extends AddBabySitterRequestState {
  final String errorMessage;
  AddChildFailure({required this.errorMessage});
}

final class AddChildLoading extends AddBabySitterRequestState {}

final class AddChildSuccess extends AddBabySitterRequestState {}
//! select time state
final class SelectTimeFailure extends AddBabySitterRequestState {
  final String errorMessage;
  SelectTimeFailure({required this.errorMessage});
}

final class SelectTimeLoading extends AddBabySitterRequestState {}

final class SelectTimeSuccess extends AddBabySitterRequestState {}
