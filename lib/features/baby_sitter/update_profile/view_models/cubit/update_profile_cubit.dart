import 'dart:io';
import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:baby_care/core/helper/location/get_current_location.dart';
import 'package:baby_care/core/helper/location/location_permission.dart';
import 'package:baby_care/core/helper/pick_image.dart';
import 'package:baby_care/core/network/supabase/database/add_data.dart';
import 'package:baby_care/core/network/supabase/storage/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  //! variables
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final experienceController = TextEditingController();
  final aboutMeController = TextEditingController();
  final salaryController = TextEditingController();
  final perTimeController = TextEditingController(text: "per time");
  final currencyController = TextEditingController(text: "USD");
  final supabase = getIt<SupabaseClient>();
  File? file;
  bool? permission;
  Position? position;
  final formKey = GlobalKey<FormState>();
  //! function

  // pick image
  pickImage() async {
    try {
      emit(UploadImageLoading());
      file = await pickAndUploadImages();
      emit(UploadImageSuccess());
    } catch (e) {
      emit(
        UploadImageFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  // pick Location
  pickLocation() async {
    try {
      emit(SelectLocationLoading());
      permission = await requestLocationPermission();
      if (permission == true) {
        position = await getCurrentLocation();
        emit(SelectLocationSuccess());
      } else {
        emit(LocationRequired());
      }
    } catch (e) {
      emit(
        SelectLocationFailure(errorMessage: e.toString()),
      );
    }
  }

  // update profile
  updateProfile() async {
    if (formKey.currentState!.validate() &&
        position != null &&
        file != null &&
        salaryController.text.isNotEmpty) {
      try {
        emit(UpdateProfileLoading());
        await addData(
          tableName: "baby_sitters",
          data: {
            "id": supabase.auth.currentUser?.id??"011a28a9-976b-4b38-87af-323c71821737",
            "name": nameController.text,
            "age": ageController.text,
            "experiance": experienceController.text,
            "about_me": aboutMeController.text,
            "salary": salaryController.text,
            "longtude": position!.longitude,
            "latitude": position!.latitude,
            "image":await uploadFileToSupabaseStorage(file: file!),
          },
        );
        await getIt<SupabaseClient>()
        .from("users")
        .update({"complete_profile": true})
        .eq("id", getIt<SupabaseClient>().auth.currentUser!.id);
        emit(UpdateProfileSuccess());
      } on Exception catch (e) {
        emit(UpdateProfileFailure(
          errorMessage: e.toString(),
        ));
      }
    } else {
      emit(UpdateProfileFieldsEmpty());
    }
  }

  dispose() {
    nameController.dispose();
    ageController.dispose();
    experienceController.dispose();
    aboutMeController.dispose();
    salaryController.dispose();
    perTimeController.dispose();
    currencyController.dispose();
  }
}
