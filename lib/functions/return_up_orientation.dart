import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationUp extends StatelessWidget {
  final Widget child;

  const OrientationUp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return child;
  }
}