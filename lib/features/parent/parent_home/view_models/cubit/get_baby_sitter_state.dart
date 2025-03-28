part of 'get_baby_sitter_cubit.dart';

sealed class GetBabySitterState {}

final class GetBabySitterInitial extends GetBabySitterState {}

final class GetBabySitterSuccess extends GetBabySitterState {}

final class GetBabySitterFailure extends GetBabySitterState {
  final String error;

  GetBabySitterFailure({required this.error});
}

final class GetBabySitterLoading extends GetBabySitterState {}

final class GetBabySitterEmpty extends GetBabySitterState {}
final class ShowCardDetails extends GetBabySitterState {}
//! location state
final class RequestLocationPermission extends GetBabySitterState {}
