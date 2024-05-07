import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  LocationPermission? permission;
  bool serviceEnabled = false;
  Future<bool> handleLocationPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      toast.showInfo("Sua localização esta desativada, por favor ative", label: "Ative a localização no seu dispositivo");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        toast.showInfo("Permissão negada", label: "Localização");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      toast.showInfo("Permissão permanentemente negada", label: "Localização");
      return false;
    }
    return true;
  }

  Future<Position> getCurrentPosition() async {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}
