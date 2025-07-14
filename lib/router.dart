import 'package:dating_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dating_app/features/auth/presentation/pages/login_page.dart';
import 'package:dating_app/features/auth/presentation/pages/register_page.dart';
import 'package:dating_app/features/auth/presentation/pages/splash_page.dart';
import 'package:dating_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:dating_app/features/home/presentation/pages/home_page.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dating_app/features/profile/presentation/pages/profile_page.dart';
import 'package:dating_app/features/profile/presentation/pages/upload_photo_page.dart';
import 'package:dating_app/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static const String splashScreen = '/';
  static const String loginScreen = '/login';
  static const String registerScreen = '/register';
  static const String homeScreen = '/home';
  static const String profileScreen = '/profile';
  static const String uploadPhotoScreen = '/uploadPhoto';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      // auth
      case registerScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<AuthBloc>(
                create: (_) => getIt<AuthBloc>(),
                child: const RegisterPage(),
              ),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<AuthBloc>(
                create: (_) => getIt<AuthBloc>(),
                child: const LoginPage(),
              ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<HomeBloc>(
                create: (_) => getIt<HomeBloc>(),
                child: HomePage(),
              ),
        );

      case profileScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<ProfileBloc>(
                create: (_) => getIt<ProfileBloc>(),
                child: const ProfileScreen(),
              ),
        );

      case uploadPhotoScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<ProfileBloc>(
                create: (_) => getIt<ProfileBloc>(),
                child: const UploadPhotoScreen(),
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
