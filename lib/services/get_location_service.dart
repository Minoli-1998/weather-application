import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocationService {
  Future<String> getCityNameByLocation() async {
    // request permission from the user
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // get the current location
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    );

    print(position.latitude);
    print(position.longitude);

    // convert the location in to list of place marks
    final Geocoding geocoding = Geocoding();

    List<Placemark> placeMarks = await geocoding.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    String cityName = placeMarks[0].locality!;
    print(cityName);

    return cityName;
  }
}
