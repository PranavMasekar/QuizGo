import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double getHeight({double percentage = 1}) =>
      MediaQuery.of(this).size.height * percentage;
  double getWidth({double percentage = 1}) =>
      MediaQuery.of(this).size.width * percentage;
}
