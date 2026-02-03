import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationHelper {
  static Future<LatLng?> initLocation() async {
    // minta izin dulu
    var status = await Permission.location.request();
    print(status.toString());
    if (status.isGranted) {
      print("✅ Izin lokasi diberikan");
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );
      return LatLng(position.latitude, position.longitude);
    } else if (status.isDenied) {
      print("⚠️ Izin lokasi ditolak");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    return null; // kalau ditolak, return null
  }
}
