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

  /// `Selaheltelmeez`
  String get appTitle {
    return Intl.message(
      'Selaheltelmeez',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_btn {
    return Intl.message(
      'Login',
      name: 'login_btn',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forget_my_password {
    return Intl.message(
      'Forgot your password?',
      name: 'forget_my_password',
      desc: '',
      args: [],
    );
  }

  /// `Register a new account`
  String get create_new_account {
    return Intl.message(
      'Register a new account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `You can login with`
  String get login_with_social {
    return Intl.message(
      'You can login with',
      name: 'login_with_social',
      desc: '',
      args: [],
    );
  }

  /// `Update Your Email or mobile`
  String get update_email_or_mobile {
    return Intl.message(
      'Update Your Email or mobile',
      name: 'update_email_or_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Update Information`
  String get update_information {
    return Intl.message(
      'Update Information',
      name: 'update_information',
      desc: '',
      args: [],
    );
  }

  /// `Send Activation Message`
  String get send_activation_message {
    return Intl.message(
      'Send Activation Message',
      name: 'send_activation_message',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Email / Mobile `
  String get email_or_mobile {
    return Intl.message(
      'Email / Mobile ',
      name: 'email_or_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Field Required`
  String get field_required {
    return Intl.message(
      'Field Required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Email`
  String get incorrect_email {
    return Intl.message(
      'Incorrect Email',
      name: 'incorrect_email',
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

  /// `Restore Information`
  String get restore_information {
    return Intl.message(
      'Restore Information',
      name: 'restore_information',
      desc: '',
      args: [],
    );
  }

  /// `Send Confirmation Message`
  String get send_confirmation_message {
    return Intl.message(
      'Send Confirmation Message',
      name: 'send_confirmation_message',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get update_password {
    return Intl.message(
      'Update Password',
      name: 'update_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Password Not the Same`
  String get password_not_matched {
    return Intl.message(
      'Password Not the Same',
      name: 'password_not_matched',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Activation Code`
  String get activation_code {
    return Intl.message(
      'Activation Code',
      name: 'activation_code',
      desc: '',
      args: [],
    );
  }

  /// `Activate Account`
  String get activate_account {
    return Intl.message(
      'Activate Account',
      name: 'activate_account',
      desc: '',
      args: [],
    );
  }

  /// `Enter Activation Code`
  String get enter_activation_code {
    return Intl.message(
      'Enter Activation Code',
      name: 'enter_activation_code',
      desc: '',
      args: [],
    );
  }

  /// `activate`
  String get activate {
    return Intl.message(
      'activate',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message(
      'Student',
      name: 'student',
      desc: '',
      args: [],
    );
  }

  /// `Parent`
  String get parent {
    return Intl.message(
      'Parent',
      name: 'parent',
      desc: '',
      args: [],
    );
  }

  /// `Teacher`
  String get teacher {
    return Intl.message(
      'Teacher',
      name: 'teacher',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Email or Mobile`
  String get incorrect_email_or_mobile {
    return Intl.message(
      'Incorrect Email or Mobile',
      name: 'incorrect_email_or_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Choose Year`
  String get choose_year {
    return Intl.message(
      'Choose Year',
      name: 'choose_year',
      desc: '',
      args: [],
    );
  }

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get get_continue {
    return Intl.message(
      'Continue',
      name: 'get_continue',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorate {
    return Intl.message(
      'Governorate',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `My Country is Egypt`
  String get my_country {
    return Intl.message(
      'My Country is Egypt',
      name: 'my_country',
      desc: '',
      args: [],
    );
  }

  /// `Birth Year`
  String get birth_year {
    return Intl.message(
      'Birth Year',
      name: 'birth_year',
      desc: '',
      args: [],
    );
  }

  /// `Continue Information`
  String get continue_information {
    return Intl.message(
      'Continue Information',
      name: 'continue_information',
      desc: '',
      args: [],
    );
  }

  /// `Continue Sign Up Information`
  String get continue_signup_information {
    return Intl.message(
      'Continue Sign Up Information',
      name: 'continue_signup_information',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
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
