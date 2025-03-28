
import 'package:baby_care/features/parent/parent_home/models/baby_sitter_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<List<BabySitterModel>> findNearbyPlaces({
  required List<BabySitterModel> allPlaces,
  required Position currentLocation,
}) async {
  List<BabySitterModel> nearbyPlaces = [];

  for (var place in allPlaces) {
    double distance = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      double.parse(place.latitude),
      double.parse(place.longtude),
    );

    String locationName = 'Loading...';
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(place.latitude),
        double.parse(place.longtude),
      );
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        locationName = "${placemark.street}, ${placemark.locality}, ${placemark.country}";
      }
    } catch (e) {
      locationName = 'Unknown location';
    }

    nearbyPlaces.add(place.copyWith(distance: distance, locationName: locationName));
  }

  nearbyPlaces.sort((a, b) => a.distance!.compareTo(b.distance!));
  return nearbyPlaces;
}