import 'package:cloudwalk_package/cloudwalk_package.dart';
import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle muted(BuildContext context) => copyWith(color: context.color.secondaryText);
}
