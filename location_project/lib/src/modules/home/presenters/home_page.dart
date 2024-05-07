import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_project/src/core/components/error_default_page.dart';
import 'package:location_project/src/modules/home/aplication/stores/home_store.dart';
import 'package:location_project/src/modules/home/presenters/components/error_limit_request_api_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final store = context.read<HomeStore>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
          listenable: store,
          builder: (context, _) {
            return FutureState(
              future: store.init(),
              onError: (context, error) {
                if (error is IpapiLimitError) {
                  return ErrorLimitRequestApiPage(error: error, store: store);
                }
                return ErrorDefaultPage(onTryAgain: () => store.tryAgain());
              },
              onComplete: (context, markers) => FlutterMap(
                options: MapOptions(
                  enableScrollWheel: false,
                  screenSize: const Size(double.infinity, double.infinity),
                  center: const LatLng(-21.7887, -46.5285),
                  zoom: 12,
                  minZoom: 10,
                  maxZoom: 18,
                ),
                nonRotatedChildren: [
                  TileLayer(
                    urlTemplate: store.urlMap,
                    additionalOptions: const {
                      'accessToen': 'pk.eyJ1IjoiZWR1YXJkb2hybXVuaXoiLCJhIjoiY2xpNG9rdGtxMmU2NTNucDlndmsyczFnNiJ9.CNYt7belU4xgeBx_6bz1Kw',
                    },
                  ),
                  MarkerLayer(markers: markers)
                ],
              ),
            );
          }),
    );
  }
}
