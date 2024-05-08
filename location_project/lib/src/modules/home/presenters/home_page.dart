import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:location_project/src/modules/home/presenters/components/error_network_page.dart';
import 'package:location_project/src/modules/home/aplication/stores/home_store.dart';
import 'package:location_project/src/modules/home/presenters/components/error_limit_request_api_page.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final store = context.read<HomeStore>();
  late String path;
  @override
  void initState() {
    store.getPath().then((value) => path = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          return Scaffold(
              floatingActionButton: store.serviceLocationEnable
                  ? const SizedBox.shrink()
                  : FloatingActionButton.small(onPressed: () => store.tryAgain(), child: const Icon(Icons.location_searching)),
              body: FutureState(
                future: store.init(),
                onError: (context, error) {
                  if (error is IpapiLimitError) {
                    return ErrorLimitRequestApiPage(error: error, store: store);
                  }
                  return ErrorNetworkPage(onTryAgain: () => store.tryAgain());
                },
                onComplete: (context, markers) => FlutterMap(
                  mapController: store.mapController,
                  options: MapOptions(
                    enableScrollWheel: false,
                    screenSize: const Size(double.infinity, double.infinity),
                    center: markers[0].point,
                    zoom: 12,
                    minZoom: 10,
                    maxZoom: 18,
                  ),
                  nonRotatedChildren: [
                    TileLayer(
                      urlTemplate: store.urlMap,
                      tileProvider: CachedTileProvider(
                        maxStale: const Duration(days: 30),
                        store: HiveCacheStore(
                          path,
                          hiveBoxName: 'HiveCacheStore',
                        ),
                      ),
                    ),
                    MarkerLayer(markers: markers)
                  ],
                ),
              ));
        });
  }
}
