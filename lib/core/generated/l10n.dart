// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Anasayfa`
  String get home {
    return Intl.message('Anasayfa', name: 'home', desc: '', args: []);
  }

  /// `Profil`
  String get profile {
    return Intl.message('Profil', name: 'profile', desc: '', args: []);
  }

  /// `Devam Et`
  String get continueText {
    return Intl.message('Devam Et', name: 'continueText', desc: '', args: []);
  }

  /// `Giriş`
  String get login {
    return Intl.message('Giriş', name: 'login', desc: '', args: []);
  }

  /// `Giriş Yap!`
  String get loginHint {
    return Intl.message('Giriş Yap!', name: 'loginHint', desc: '', args: []);
  }

  /// `Şimdi Kaydol`
  String get registerNow {
    return Intl.message(
      'Şimdi Kaydol',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Kayıt Ol!`
  String get register {
    return Intl.message('Kayıt Ol!', name: 'register', desc: '', args: []);
  }

  /// `E-posta`
  String get email {
    return Intl.message('E-posta', name: 'email', desc: '', args: []);
  }

  /// `Şifre`
  String get password {
    return Intl.message('Şifre', name: 'password', desc: '', args: []);
  }

  /// `Merhabalar`
  String get hello {
    return Intl.message('Merhabalar', name: 'hello', desc: '', args: []);
  }

  /// `Şifremi unuttum`
  String get forgotPassword {
    return Intl.message(
      'Şifremi unuttum',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Lütfen tüm alanları doldurun`
  String get fillAllFieldsRequired {
    return Intl.message(
      'Lütfen tüm alanları doldurun',
      name: 'fillAllFieldsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Bir hesabın yok mu?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Bir hesabın yok mu?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.`
  String get loginContent {
    return Intl.message(
      'Tempus varius a vitae interdum id\ntortor elementum tristique eleifend at.',
      name: 'loginContent',
      desc: '',
      args: [],
    );
  }

  /// `Hoş geldiniz`
  String get welcome {
    return Intl.message('Hoş geldiniz', name: 'welcome', desc: '', args: []);
  }

  /// `Giriş Yap`
  String get loginButton {
    return Intl.message('Giriş Yap', name: 'loginButton', desc: '', args: []);
  }

  /// `Kayıt Ol`
  String get registerButton {
    return Intl.message('Kayıt Ol', name: 'registerButton', desc: '', args: []);
  }

  /// `Ad Soyad`
  String get nameSurname {
    return Intl.message('Ad Soyad', name: 'nameSurname', desc: '', args: []);
  }

  /// `Şifre Tekrar`
  String get confirmPassword {
    return Intl.message(
      'Şifre Tekrar',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Şifreler eşleşmiyor`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Şifreler eşleşmiyor',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Zaten bir hesabın var mı?`
  String get doHaveAnAccount {
    return Intl.message(
      'Zaten bir hesabın var mı?',
      name: 'doHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Kullanıcı sözleşmesini `
  String get termsAndConditionsPart1 {
    return Intl.message(
      'Kullanıcı sözleşmesini ',
      name: 'termsAndConditionsPart1',
      desc: '',
      args: [],
    );
  }

  /// `okudum ve kabul ediyorum.`
  String get termsAndConditionsPart2 {
    return Intl.message(
      'okudum ve kabul ediyorum.',
      name: 'termsAndConditionsPart2',
      desc: '',
      args: [],
    );
  }

  /// `Bu sözleşmeyi okuyarak devam ediniz lütfen.`
  String get termsAndConditionsPart3 {
    return Intl.message(
      'Bu sözleşmeyi okuyarak devam ediniz lütfen.',
      name: 'termsAndConditionsPart3',
      desc: '',
      args: [],
    );
  }

  /// `Profil Detayı`
  String get profileDetail {
    return Intl.message(
      'Profil Detayı',
      name: 'profileDetail',
      desc: '',
      args: [],
    );
  }

  /// `Sınırlı Teklif`
  String get limitedOffer {
    return Intl.message(
      'Sınırlı Teklif',
      name: 'limitedOffer',
      desc: '',
      args: [],
    );
  }

  /// `Jeton paketini seçerek bonus kazanın ve yeni bölümlerin kilidini açın!`
  String get limitedOfferDescription {
    return Intl.message(
      'Jeton paketini seçerek bonus kazanın ve yeni bölümlerin kilidini açın!',
      name: 'limitedOfferDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tüm Jetonları Gör`
  String get limitedOfferButton {
    return Intl.message(
      'Tüm Jetonları Gör',
      name: 'limitedOfferButton',
      desc: '',
      args: [],
    );
  }

  /// `Premium Hesap`
  String get premiumAccount {
    return Intl.message(
      'Premium Hesap',
      name: 'premiumAccount',
      desc: '',
      args: [],
    );
  }

  /// `Daha Fazla Eşleşme`
  String get moreMatches {
    return Intl.message(
      'Daha Fazla Eşleşme',
      name: 'moreMatches',
      desc: '',
      args: [],
    );
  }

  /// `Öne Çıkarma`
  String get boost {
    return Intl.message('Öne Çıkarma', name: 'boost', desc: '', args: []);
  }

  /// `Daha Fazla Beğeni`
  String get moreLikes {
    return Intl.message(
      'Daha Fazla Beğeni',
      name: 'moreLikes',
      desc: '',
      args: [],
    );
  }

  /// `Fotoğraf Ekle`
  String get uploadPhoto {
    return Intl.message(
      'Fotoğraf Ekle',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Beğendiğim Filmler`
  String get likedMovies {
    return Intl.message(
      'Beğendiğim Filmler',
      name: 'likedMovies',
      desc: '',
      args: [],
    );
  }

  /// `Fotoğraflarınızı Yükleyin`
  String get uploadYourPhoto {
    return Intl.message(
      'Fotoğraflarınızı Yükleyin',
      name: 'uploadYourPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Resources out incentivize\nrelaxation floor loss cc.`
  String get uploadPhotoHint {
    return Intl.message(
      'Resources out incentivize\nrelaxation floor loss cc.',
      name: 'uploadPhotoHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
