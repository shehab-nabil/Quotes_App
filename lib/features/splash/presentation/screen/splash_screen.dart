import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotes_app/core/utils/app_colors.dart';
import 'package:quotes_app/core/utils/assets_manager.dart';

import '../../../../config/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000),
        () => Navigator.pushReplacementNamed(context, Routes.randomQuoteRoute));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(ImageAssets.quote),
      ),
    );
  }
}
