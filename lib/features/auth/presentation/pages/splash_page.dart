import 'dart:async';

import 'package:dating_app/core/constants/constants.dart';
import 'package:dating_app/core/constants/images.dart';
import 'package:dating_app/core/theme/app_colors.dart';
import 'package:dating_app/initializer.dart';
import 'package:dating_app/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    () async {
      await Future.delayed(Duration.zero);
      _checkUserLoggedIn();
    }();
  }

  Future<void> _checkUserLoggedIn() async {
    await Future.delayed(const Duration(seconds: 2));

    // Burada authTokenDatingApp anahtarını kullanarak oturum kontrolü yapıyoruz
    final SharedPreferences prefs = getIt<SharedPreferences>();
    String? isLoggedIn = prefs.getString(authTokenDatingApp);

    if (isLoggedIn != null) {
      Navigator.pushReplacementNamed(context, RouteGenerator.homeScreen);
    } else {
      Navigator.pushReplacementNamed(context, RouteGenerator.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Image.asset(AppImages.splash, fit: BoxFit.fill),
    );
  }
}
