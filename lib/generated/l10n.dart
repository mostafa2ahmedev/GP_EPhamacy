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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Username`
  String get AuthUsername {
    return Intl.message(
      'Username',
      name: 'AuthUsername',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get AuthPassword {
    return Intl.message(
      'Password',
      name: 'AuthPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get AuthSignIn {
    return Intl.message(
      'Sign In',
      name: 'AuthSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Passowrd ?`
  String get AuthForgotPassword {
    return Intl.message(
      'Forgot Passowrd ?',
      name: 'AuthForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get HomeDashboard {
    return Intl.message(
      'Statistics',
      name: 'HomeDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get HomeStores {
    return Intl.message(
      'Stores',
      name: 'HomeStores',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get HomePatients {
    return Intl.message(
      'Patients',
      name: 'HomePatients',
      desc: '',
      args: [],
    );
  }

  /// `AddAccount`
  String get AddAccount {
    return Intl.message(
      'AddAccount',
      name: 'AddAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get Resgistarion {
    return Intl.message(
      'Sign In',
      name: 'Resgistarion',
      desc: '',
      args: [],
    );
  }

  /// `SidalyaEltlba`
  String get SidalyaEltlba {
    return Intl.message(
      'SidalyaEltlba',
      name: 'SidalyaEltlba',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get Mode {
    return Intl.message(
      'Mode',
      name: 'Mode',
      desc: '',
      args: [],
    );
  }

  /// `PhoneNumber`
  String get PhoneNumber {
    return Intl.message(
      'PhoneNumber',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sales inventory`
  String get HsrElmbe3at {
    return Intl.message(
      'Sales inventory',
      name: 'HsrElmbe3at',
      desc: '',
      args: [],
    );
  }

  /// `Colleges inventory`
  String get HsrElkolyat {
    return Intl.message(
      'Colleges inventory',
      name: 'HsrElkolyat',
      desc: '',
      args: [],
    );
  }

  /// `3ohdeElm5zn`
  String get H3ohdeElm5zn {
    return Intl.message(
      '3ohdeElm5zn',
      name: 'H3ohdeElm5zn',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Lagnuage`
  String get Language {
    return Intl.message(
      'Lagnuage',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get LogOut {
    return Intl.message(
      'Log Out',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `Medicines`
  String get Medicines {
    return Intl.message(
      'Medicines',
      name: 'Medicines',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
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
