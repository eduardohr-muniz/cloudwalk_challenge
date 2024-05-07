import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:location_project/src/modules/home/aplication/services/geolocator_service.dart';
import 'package:location_project/src/modules/home/aplication/stores/home_store.dart';
import 'package:location_project/src/modules/home/presenters/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => GeolocatorService()),
        Bind.factory((i) => IpapiDatasource(http: i())),
        Bind.factory((i) => IpapiRepository(datasource: i())),
        Bind.singleton((i) => HomeStore(geolocatorService: i(), ipApiRepo: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
