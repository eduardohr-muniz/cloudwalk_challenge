import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';

Toast? _toast;

Toast get toast {
  assert(_toast != null, """Add ToastProvider.builder in your MaterialApp;
       return MaterialApp(
         builder: ToastProvider.builder,
         ...
  """);
  return _toast!;
}

class ToastProvider {
  static Widget builder(BuildContext context, Widget? child) {
    return Overlay(initialEntries: [
      OverlayEntry(builder: (context) {
        return _BuildListener(
          child: child ?? const SizedBox.shrink(),
        );
      }),
    ]);
  }
}

class _BuildListener extends StatelessWidget {
  final Widget child;
  const _BuildListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    _toast = Toast.of(context);
    return child;
  }
}
