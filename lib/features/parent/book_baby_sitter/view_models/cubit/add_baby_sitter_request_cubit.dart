import 'dart:developer';

import 'package:baby_care/core/di/dependancy_injection.dart';
import 'package:baby_care/core/helper/location/get_current_location.dart';
import 'package:baby_care/core/helper/location/location_permission.dart';
import 'package:baby_care/core/network/supabase/database/add_data.dart';
import 'package:baby_care/features/parent/book_baby_sitter/models/child_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

part 'add_baby_sitter_request_state.dart';

class AddBabySitterRequestCubit extends Cubit<AddBabySitterRequestState> {
  AddBabySitterRequestCubit() : super(AddBabySitterRequestInitial());
  final supabase = getIt<SupabaseClient>();
  final noteController = TextEditingController();
  final requestId = Uuid().v4();
  addRequest({required String babySitterId}) async {
    if (children.isNotEmpty &&
        startTime != null &&
        endTime != null &&
        date != null &&
        noteController.text.isNotEmpty &&
        locationName != "Unknown") {
      try {
        emit(AddBabySitterRequestLoading());
        await addData(tableName: "requests", data: {
          "id":requestId,
          "baby_sitter_id": babySitterId,
          "parent_id": supabase.auth.currentUser!.id,
          "date": date,
          "form": startTime,
          "to": endTime,
          "time": selectedTime,
          "children": {"children": children.map((e) => e.toJson()).toList()},
          "address": locationName,
          "note": noteController.text,
        });
        await addData(tableName: "chats", data: {
          "id":requestId,
        });
        emit(AddBabySitterRequestSuccess());
      } on Exception catch (e) {
        emit(
          AddBabySitterRequestFailure(errorMessage: e.toString()),
        );
      }
    } else {
      emit(AddBabySitterRequestFieldsRequired());
    }
  }

  //! add child
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  List<ChildModel> children = [];
  final formKey = GlobalKey<FormState>();
  addChild() {
    try {
      if (formKey.currentState!.validate()) {
        emit(AddChildLoading());
        children.add(
          ChildModel(name: nameController.text, age: ageController.text),
        );
        emit(AddChildSuccess());
        nameController.clear();
        ageController.clear();
      }
    } on Exception catch (e) {
      emit(AddChildFailure(errorMessage: e.toString()));
    }
  }

  //! get current location
  bool hasPermission = false;
  String locationName = 'Unknown';
  Position? position;
  getCurrentLocationName() async {
    try {
      emit(SelectLocationLoading());
      hasPermission = await requestLocationPermission();
      if (hasPermission) {
        position = await getCurrentLocation();
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position!.latitude, position!.longitude);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          locationName =
              "${placemark.street}, ${placemark.locality}, ${placemark.country}";
        }
      }
      emit(SelectLocationSuccess());
    } on Exception catch (e) {
      emit(SelectLocationFailure(errorMessage: e.toString()));
    }
  }

  //! pick time
  TimeOfDay time = TimeOfDay.now();
  String? startTime;
  String? endTime;

  pickTime({required BuildContext context, required bool isStartTime}) async {
    try {
      var date = await showTimePicker(
        context: context,
        initialTime: time,
      );
      if (date != null) {
        String formattedTime =
            "${date.hourOfPeriod}:${date.minute.toString().padLeft(2, '0')} ${date.period == DayPeriod.am ? "AM" : "PM"}";
        if (isStartTime) {
          startTime = formattedTime;
        } else {
          endTime = formattedTime;
        }
        emit(SelectTimeSuccess());
      }
    } on Exception catch (e) {
      emit(
        SelectTimeFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  //! time
  List<String> times = ["Morning", "Evening", "Afternon", "night"];
  String selectedTime = "Morning";
  selectTime({required int index}) {
    selectedTime = times[index];
    emit(SelectTimeSuccess());
  }

  //
  String? date;
  selectDate(String date) {
    this.date = date;
    log(this.date!);
  }
}
