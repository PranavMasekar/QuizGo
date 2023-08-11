import 'package:flutter/material.dart';

import 'export_constants.dart';

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(
      color: AppColors.iconColor,
    ),
  );
}
