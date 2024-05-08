import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clodwalk Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeCustom.lightTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      builder: (context, child) => ToastProvider.builder(context, child),
    );
  }
}
