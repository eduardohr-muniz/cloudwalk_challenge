import 'package:flutter/material.dart';
import 'package:location_project/src/core/helpers/assets.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.pinClodwalk,
      color: Colors.red,
      fit: BoxFit.cover,
    );
  }
}
