import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF06030c);
  static const Color textColor = Color(0xFFf7f7f7);
  static const Color iconColor = Color(0xFFf7f7f7);
  static const Color purpleColor = Color(0xFF953bef);
  static const Color purpleShade = Color(0xFFb64cb9);
  static const Color orangeShade = Color(0xFFf56b50);
  static const Color pinkShade = Color(0xFFd95d7f);
  static const Color greyColor = Color(0xFF555154);
  static const Color redColor = Color(0xFFff3333);
  static const Color darkPurple = Color(0xFF080809);

  static RadialGradient purpleGradient = const RadialGradient(
    colors: [Color(0xFF131238), primaryColor],
    radius: 0.7,
  );
  static RadialGradient pinkGradient = const RadialGradient(
    colors: [Color(0xFF40324b), primaryColor],
    radius: 0.7,
  );
  static RadialGradient creamGradient = RadialGradient(
    colors: [const Color(0xFFda6d27).withOpacity(0.3), primaryColor],
    radius: 0.7,
  );
  static RadialGradient redGradient = RadialGradient(
    colors: [const Color(0xFFc82f34).withOpacity(0.3), primaryColor],
    radius: 0.85,
  );
  static LinearGradient buttonGradient = const LinearGradient(
    colors: [purpleColor, purpleShade, pinkShade, orangeShade],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );
}
