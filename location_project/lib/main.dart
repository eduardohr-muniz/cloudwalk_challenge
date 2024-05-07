import 'package:flutter/material.dart';
import 'package:location_project/src/app_module.dart';
import 'package:location_project/src/app_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
