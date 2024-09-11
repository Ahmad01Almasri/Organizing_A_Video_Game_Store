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

  /// `The Devices`
  String get title {
    return Intl.message(
      'The Devices',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Laptop`
  String get laptop {
    return Intl.message(
      'Laptop',
      name: 'laptop',
      desc: '',
      args: [],
    );
  }

  /// `PlayStation`
  String get playstation {
    return Intl.message(
      'PlayStation',
      name: 'playstation',
      desc: '',
      args: [],
    );
  }

  /// `Computer`
  String get computer {
    return Intl.message(
      'Computer',
      name: 'computer',
      desc: '',
      args: [],
    );
  }

  /// `The field cannot be left empty`
  String get field_required {
    return Intl.message(
      'The field cannot be left empty',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `No devices of the selected type`
  String get no_devices {
    return Intl.message(
      'No devices of the selected type',
      name: 'no_devices',
      desc: '',
      args: [],
    );
  }

  /// `All devices`
  String get all_devices {
    return Intl.message(
      'All devices',
      name: 'all_devices',
      desc: '',
      args: [],
    );
  }

  /// `Device Name`
  String get device_name {
    return Intl.message(
      'Device Name',
      name: 'device_name',
      desc: '',
      args: [],
    );
  }

  /// `Device Type`
  String get device_type {
    return Intl.message(
      'Device Type',
      name: 'device_type',
      desc: '',
      args: [],
    );
  }

  /// `Hourly Rate`
  String get hourly_rate {
    return Intl.message(
      'Hourly Rate',
      name: 'hourly_rate',
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

  /// `Customer Name`
  String get customer_name {
    return Intl.message(
      'Customer Name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Set Reminder`
  String get set_reminder {
    return Intl.message(
      'Set Reminder',
      name: 'set_reminder',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `End Session`
  String get end_session {
    return Intl.message(
      'End Session',
      name: 'end_session',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Session Closed`
  String get session_closed {
    return Intl.message(
      'Session Closed',
      name: 'session_closed',
      desc: '',
      args: [],
    );
  }

  /// `Customer Account: `
  String get customer_account {
    return Intl.message(
      'Customer Account: ',
      name: 'customer_account',
      desc: '',
      args: [],
    );
  }

  /// `SYP`
  String get currency {
    return Intl.message(
      'SYP',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Device Deletion`
  String get confirm_delete_device {
    return Intl.message(
      'Confirm Device Deletion',
      name: 'confirm_delete_device',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the device?`
  String get delete_confirmation {
    return Intl.message(
      'Are you sure you want to delete the device?',
      name: 'delete_confirmation',
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

  /// `Edit Item`
  String get edit_item {
    return Intl.message(
      'Edit Item',
      name: 'edit_item',
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

  /// `Choose Time`
  String get choose_time {
    return Intl.message(
      'Choose Time',
      name: 'choose_time',
      desc: '',
      args: [],
    );
  }

  /// `Add Device`
  String get add_device {
    return Intl.message(
      'Add Device',
      name: 'add_device',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `hour`
  String get hour {
    return Intl.message(
      'hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `The session is closed`
  String get the_session_is_closed {
    return Intl.message(
      'The session is closed',
      name: 'the_session_is_closed',
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
