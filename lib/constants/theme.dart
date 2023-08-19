import 'package:flutter/material.dart';

import 'package:quiz_go/constants/export_constants.dart';

ThemeData darkTheme() {
  return ThemeData(
    primaryColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(
      color: AppColors.iconColor,
    ),
  );
}
