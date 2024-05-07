import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_project/src/modules/home/aplication/services/geolocator_service.dart';
import 'package:location_project/src/modules/home/presenters/components/marker_widget.dart';
import 'package:path_provider/path_provider.dart';

class HomeStore extends ChangeNotifier {
  final GeolocatorService geolocatorService;
  final IIpapiRepository ipApiRepo;

  HomeStore({
    required this.geolocatorService,
    required this.ipApiRepo,
  });

  String urlMap =
      "https://www.google.com/maps/vt/pb=!1m4!1m3!1i{z}!2i{x}!3i{y}!2m3!1e0!2sm!3i628362738!3m7!2spt-BR!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425";
  bool get serviceLocationEnable => geolocatorService.serviceEnabled;
  final mapController = MapController();
  Future<List<Marker>> init() async {
    final hasPermission = await geolocatorService.handleLocationPermission();

    if (!hasPermission) {
      return await loadCurrentLocationByIpapi();
    }

    return await loadCurrentLocation();
  }

  Future<String> getPath() async {
    final cacheDirectory = await getTemporaryDirectory();
    return cacheDirectory.path;
  }

  Future<List<Marker>> loadCurrentLocation() async {
    final location = await geolocatorService.getCurrentPosition();
    return [Marker(point: LatLng(location.latitude, location.longitude), builder: (context) => const MarkerWidget(), height: 25)];
  }

  Future<List<Marker>> loadCurrentLocationByIpapi() async {
    try {
      final result = await ipApiRepo.getCurrentLocale();
      Future.delayed(
          3.seconds,
          () => toast.showInfo(
                "Para uma localização mais precisa, ative a sua localização do seu aparelho e forneça as permissões necessárias",
                label: "Precisão",
              ));
      return [Marker(point: LatLng(result.latitude, result.longitude), builder: (context) => const MarkerWidget(), height: 25)];
    } catch (e) {
      throw IpapiLimitError(error: e);
    }
  }

  void tryAgain() {
    notifyListeners();
  }

  Future<void> requestPermission() async {
    final hasPermission = await geolocatorService.handleLocationPermission();
    if (!hasPermission) return;
    notifyListeners();
  }
}
