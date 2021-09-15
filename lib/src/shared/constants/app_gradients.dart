import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static const purpleGradient = LinearGradient(
    colors: <Color>[
      AppColors.purple,
      AppColors.wine,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
