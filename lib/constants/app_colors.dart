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
  static const Color greenColor = Color(0xFF50C878);
  static const Color purpleGradientColor = Color(0xFF131238);
  static const Color pinkGradientColor = Color(0xFF40324b);
  static const Color earthColor = Color(0xFF5faded);
  static const Color narutoColor = Color(0xFFf2a30b);
  static Color creamGradientColor = const Color(0xFFda6d27).withOpacity(0.3);
  static Color redGradientColor = const Color(0xFFc82f34).withOpacity(0.3);
  static Color dockerColor = const Color(0xFF0db7ed);
  static Color linuxColor = const Color(0xFFffcc33);
  static Color javaScriptColor = const Color(0xFFFFD43B);
  static Color mySQLColor = const Color(0xFF00758f);
  static Color kubernetesColor = const Color(0xFF123786);

  static RadialGradient purpleGradient = const RadialGradient(
    colors: [purpleGradientColor, primaryColor],
    radius: 0.7,
  );
  static RadialGradient pinkGradient = const RadialGradient(
    colors: [pinkGradientColor, primaryColor],
    radius: 0.7,
  );
  static RadialGradient creamGradient = RadialGradient(
    colors: [creamGradientColor, primaryColor],
    radius: 0.7,
  );
  static RadialGradient redGradient = RadialGradient(
    colors: [redGradientColor, primaryColor],
    radius: 0.85,
  );
  static LinearGradient buttonGradient = const LinearGradient(
    colors: [purpleColor, purpleShade, pinkShade, orangeShade],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );
}
