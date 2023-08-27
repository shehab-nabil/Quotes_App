import 'package:flutter/material.dart';
import 'package:quotes_app/config/routes/routes.dart';
import 'package:quotes_app/core/utils/app_strings.dart';

import 'config/themes/app_theme.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
