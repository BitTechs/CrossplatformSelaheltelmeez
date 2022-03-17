import 'dart:convert';
import 'package:selaheltelmeez/core/local_storage/app_user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUserLocalStorageProvider {
  static final Future<SharedPreferences> _sharedPreferenceInstance =
      SharedPreferences.getInstance();

  static const String _keyName = "App_User";

  static Future<void> addAsJsonAsync(Map<String, dynamic> toJson) async =>
      await _sharedPreferenceInstance
          .then((value) => value.setString(_keyName, jsonEncode(toJson)));

  static Future<bool> removeAsync() async =>
      await _sharedPreferenceInstance.then((value) => value.remove(_keyName));


  static Future<Map<String, dynamic>> readAsJsonAsync() async =>
      await _sharedPreferenceInstance.then((value) => jsonDecode(value.getString(_keyName)!));

  static Future<AppUserEntity> readAsAppUserObjectAsync() async {
    final mappedJson = await readAsJsonAsync();
    return AppUserEntity(
        isVerified: mappedJson["isVerified"] as bool,
        fullName: mappedJson["fullName"] as String,
        email: mappedJson["email"] as String,
        mobileNumber: mappedJson["mobileNumber"] as String,
        grade: mappedJson["grade"] as String,
        country: mappedJson["country"] as String,
        dateOfBirth: mappedJson["dateOfBirth"] as String,
        referralCode: mappedJson["referralCode"] as String,
        role: mappedJson["role"] as String,
        governorate: mappedJson["governorate"] as String,
        avatarUrl: mappedJson["avatarUrl"] as String,
        accessToken: mappedJson["accessToken"] as String,
        refreshToken: mappedJson["refreshToken"] as String,
        isPremium: mappedJson["isPremium"] as bool);
  }
}
