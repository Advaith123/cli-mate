import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          // async makes time consuming things happen in the background
          desiredAccuracy: LocationAccuracy.low);
      Position LastKnown = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      // guess what, the old version worked so gonna stick with that for now
      //print(LastKnown);
    } catch (e) {
      print(e);
    }
  }
}
