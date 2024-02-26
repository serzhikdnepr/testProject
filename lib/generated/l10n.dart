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

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get eMailAddress {
    return Intl.message(
      'Email address',
      name: 'eMailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match!`
  String get passwordsMismatch {
    return Intl.message(
      'Passwords do not match!',
      name: 'passwordsMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message(
      'Log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get register {
    return Intl.message(
      'Sign up',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account? `
  String get youDoNotHaveAnAccount {
    return Intl.message(
      'Don\\\'t have an account? ',
      name: 'youDoNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now`
  String get loginNow {
    return Intl.message(
      'Sign up now',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get goOut {
    return Intl.message(
      'Log Out',
      name: 'goOut',
      desc: '',
      args: [],
    );
  }

  /// `Last login time`
  String get lastSignInTime {
    return Intl.message(
      'Last login time',
      name: 'lastSignInTime',
      desc: '',
      args: [],
    );
  }

  /// `There is no items`
  String get noProducts {
    return Intl.message(
      'There is no items',
      name: 'noProducts',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get no {
    return Intl.message(
      'NO',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted successfully`
  String get objectDeletedSuccessfully {
    return Intl.message(
      'Item deleted successfully',
      name: 'objectDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `YES`
  String get yes {
    return Intl.message(
      'YES',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get deleteThisItem {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'deleteThisItem',
      desc: '',
      args: [],
    );
  }

  /// `Item create successfully`
  String get itemCreatedSuccessfully {
    return Intl.message(
      'Item create successfully',
      name: 'itemCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Item`
  String get editElement {
    return Intl.message(
      'Edit Item',
      name: 'editElement',
      desc: '',
      args: [],
    );
  }

  /// `Item Title`
  String get itemName {
    return Intl.message(
      'Item Title',
      name: 'itemName',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Item update successfully`
  String get itemUpdatedSuccessfully {
    return Intl.message(
      'Item update successfully',
      name: 'itemUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
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
