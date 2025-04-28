part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}

//! image state
final class UploadImageLoading extends UpdateProfileState {}

final class UploadImageSuccess extends UpdateProfileState {}

final class UploadImageFailure extends UpdateProfileState {
  final String errorMessage;
  UploadImageFailure({required this.errorMessage});
}

//! location state
final class SelectLocationLoading extends UpdateProfileState {}

final class SelectLocationSuccess extends UpdateProfileState {}

final class SelectLocationFailure extends UpdateProfileState {
  final String errorMessage;
  SelectLocationFailure({required this.errorMessage});
}

final class LocationRequired extends UpdateProfileState {}
//! update profile state
final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {}

final class UpdateProfileFailure extends UpdateProfileState {
  final String errorMessage;
  UpdateProfileFailure({required this.errorMessage});
}

final class UpdateProfileFieldsEmpty extends UpdateProfileState {}
