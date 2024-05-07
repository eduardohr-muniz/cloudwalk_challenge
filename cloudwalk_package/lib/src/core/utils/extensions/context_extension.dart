import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  CwColors get color => Theme.of(this).extension<CwColors>() ?? (Theme.of(this).brightness == Brightness.light ? CwColors.light : CwColors.dark);

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ///Mediaquery.size.width[w]
  double get w => MediaQuery.sizeOf(this).width;

  ///Mediaquery.size.height[h]
  double get h => MediaQuery.sizeOf(this).height;
}
