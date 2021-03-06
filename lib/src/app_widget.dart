import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/constants/constants.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budget',
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(),
          primarySwatch: AppColors.primaryMaterialColor),
      initialRoute: AppRoutes.splash,
    ).modular();
  }
}
