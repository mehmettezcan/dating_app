import 'package:dating_app/core/generated/l10n.dart';
import 'package:dating_app/core/theme/app_theme.dart';
import 'package:dating_app/initializer.dart';
import 'package:dating_app/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase'i başlatıyoruz
  await Firebase.initializeApp();

  // Hataları Firebase Crashlytics'e kaydediyoruz
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Bağımlılıkları başlatıyoruz
  initializeGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dating App',
      debugShowCheckedModeBanner: false,
      // Temayı dark olarak ayarlıyoruz
      theme: AppTheme.dark,
      // Ana sayfa olarak SplashScreen'i kullanıyoruz
      initialRoute: RouteGenerator.splashScreen,
      // Rota oluşturma işlemini yapıyoruz
      onGenerateRoute: RouteGenerator.generateRoute,
      // Yerelleştirme desteği ekliyoruz
      locale: const Locale('tr'),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
