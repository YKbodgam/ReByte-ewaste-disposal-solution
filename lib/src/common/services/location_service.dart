import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationService {
  static Future<LatLng> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) Future.error('Location services are disabled.');

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }
}
