import 'dart:async';
import 'package:baby_care/core/helper/location/find_nearest_place.dart';
import 'package:baby_care/core/helper/location/get_current_location.dart';
import 'package:baby_care/core/helper/location/location_permission.dart';
import 'package:baby_care/core/network/supabase/database/get_stream_data.dart';
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
part 'get_baby_sitter_state.dart';

class GetBabySitterCubit extends Cubit<GetBabySitterState> {
  GetBabySitterCubit() : super(GetBabySitterLoading()) {
    getBabySitterByLocation();
  }
  bool hasPermission = false;
  Position? position;
  StreamSubscription? _streamSubscription;
  List<BabySitterModel> babySitterList = [];
  List<BabySitterModel> nearestBabySitterList = [];
  List<BabySitterModel> allBabySittersList=[];

  getBabySitterByLocation() async {
    hasPermission = await requestLocationPermission();
    if (hasPermission) {
      position = await getCurrentLocation();
      await getBabySitter();
    } else {
      emit(RequestLocationPermission());
    }
  }

  getBabySitter() async {
    _streamSubscription = streamData(tableName: "baby_sitters").listen(
      (data) {
        if (data.isNotEmpty) {
          babySitterList =
              data.map((e) => BabySitterModel.fromJson(e)).toList();
          getNearestBabySitter();
        } else {
          emit(GetBabySitterEmpty());
        }
      },
      onError: (e) {
        emit(GetBabySitterFailure(error: e.toString()));
      },
    );
  }

  getNearestBabySitter() async {
    try {
      nearestBabySitterList = await findNearbyPlaces(
        allPlaces: babySitterList,
        currentLocation: position!,
      );
      allBabySittersList =nearestBabySitterList;
      emit(GetBabySitterSuccess());
    } on Exception catch (e) {
      emit(GetBabySitterFailure(error: e.toString()));
    }
  }

  //! search for baby sitter

  void searchForPlace({required String place}) {
    if (allBabySittersList.isEmpty) {
      allBabySittersList = List.from(nearestBabySitterList);
    }
    if (place.isNotEmpty) {
      nearestBabySitterList = allBabySittersList
          .where((element) =>
              element.locationName!.toLowerCase().contains(place.toLowerCase()))
          .toList();
    } else {
      nearestBabySitterList = List.from(allBabySittersList);
    }
    emit(GetBabySitterSuccess());
  }
}
