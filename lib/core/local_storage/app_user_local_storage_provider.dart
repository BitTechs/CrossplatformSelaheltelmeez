import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppUserLocalStorageProvider {

  static final Future<SharedPreferences> _sharedPreferenceInstance = SharedPreferences.getInstance();

  static const String _keyName= "App_User";

  static Future<void> addAsJsonAsync(Map<String,dynamic> toJson) async=> await _sharedPreferenceInstance.then((value) =>  value.setString(_keyName,jsonEncode(toJson)));
  static Future<bool> remoteAsync() async=> await _sharedPreferenceInstance.then((value) => value.remove(_keyName));
  static Future<Map<String, dynamic>> readAsJsonAsync() async => await _sharedPreferenceInstance.then((value) => jsonDecode(value.getString(_keyName)!));
}