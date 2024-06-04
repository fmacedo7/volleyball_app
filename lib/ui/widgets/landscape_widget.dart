import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandscapeWidget extends StatelessWidget {
  final Widget child;

  const LandscapeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return child;
  }
}