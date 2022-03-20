import 'dart:convert';
import 'package:selaheltelmeez/core/local_storage/app_user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUserLocalStorageProvider {
  static final Future<SharedPreferences> _sharedPreferenceInstance =
      SharedPreferences.getInstance();

  static AppUserEntity? sharedAppUserEntity;

  static Future<void> tryToLoadAppUserEntity() async {
    if(await _sharedPreferenceInstance.then((value)=> value.getString(_keyName) != null)){
      sharedAppUserEntity = await readAsAppUserObjectAsync();
    }
  }

  static const String _keyName = "App_User";

  static Future<void> addAsJsonAsync(Map<String, dynamic> toJson) async {
    await _sharedPreferenceInstance.then((value) => value.setString(_keyName, jsonEncode(toJson)));
  }


  static Future<bool> removeAsync() async =>
      await _sharedPreferenceInstance.then((value) => value.remove(_keyName));


  static Future<Map<String, dynamic>> readAsJsonAsync() async =>
      await _sharedPreferenceInstance.then((value) => jsonDecode(value.getString(_keyName)!));

  static Future<AppUserEntity> readAsAppUserObjectAsync() async {
    final mappedJson = await readAsJsonAsync();
    return AppUserEntity(
        isVerified: mappedJson["isVerified"] ?? sharedAppUserEntity?.isVerified,
        fullName: mappedJson["fullName"] ?? sharedAppUserEntity?.fullName,
        email: mappedJson["email"] ?? sharedAppUserEntity?.email,
        mobileNumber: mappedJson["mobileNumber"] ?? sharedAppUserEntity?.mobileNumber,
        grade: mappedJson["grade"] ?? sharedAppUserEntity?.grade,
        country: mappedJson["country"] ?? sharedAppUserEntity?.country,
        dateOfBirth: mappedJson["dateOfBirth"] ?? sharedAppUserEntity?.dateOfBirth,
        referralCode: mappedJson["referralCode"]?? sharedAppUserEntity?.referralCode,
        role: mappedJson["role"] ?? sharedAppUserEntity?.role,
        governorate: mappedJson["governorate"] ?? sharedAppUserEntity?.governorate,
        avatarUrl: mappedJson["avatarUrl"] ?? sharedAppUserEntity?.avatarUrl,
        accessToken: mappedJson["accessToken"] ?? sharedAppUserEntity?.accessToken,
        refreshToken: mappedJson["refreshToken"] ?? sharedAppUserEntity?.refreshToken,
        isPremium: mappedJson["isPremium"] ?? sharedAppUserEntity?.isPremium);
  }
}
