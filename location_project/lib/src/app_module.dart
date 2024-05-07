import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:location_project/src/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HttpDio()),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
