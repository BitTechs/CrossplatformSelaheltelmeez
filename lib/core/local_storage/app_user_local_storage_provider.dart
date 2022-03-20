import 'dart:convert';
import 'package:selaheltelmeez/core/local_storage/app_user_entity.dart';
import 'package:selaheltelmeez/features/authentication/login/login_import.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';
import 'package:selaheltelmeez/features/authentication/update_profile/model/data_transfer_object/update_profile_response.dart';
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

  static Future<void> addLoginResponseAsync(LoginResponse loginResponse) async{
        await addAsJsonAsync(loginResponse.toJson());
  }
  static Future<void> addRegisterResponseAsync(RegisterResponse registerResponse) async{
    final mappedJson = <String,dynamic>{};
    mappedJson['fullName'] = registerResponse.fullName;
    mappedJson['email'] = registerResponse.email;
    mappedJson['mobileNumber'] = registerResponse.mobileNumber;
    mappedJson['grade'] = registerResponse.grade;
    mappedJson['referralCode'] = registerResponse.referralCode;
    mappedJson['role'] = registerResponse.role;
    mappedJson['avatarUrl'] = registerResponse.avatarUrl;
    mappedJson['accessToken'] = registerResponse.accessToken;
    mappedJson['refreshToken'] = registerResponse.refreshToken;
    mappedJson['isPremium'] = registerResponse.isPremium;
    mappedJson['isVerified'] = registerResponse.isVerified;
    await addAsJsonAsync(mappedJson);
  }

  static Future<void> addUpdateProfileResponseAsync(UpdateProfileResponse updateProfileResponse) async{
    await tryToLoadAppUserEntity();
    if(sharedAppUserEntity != null){
      final mappedJson = <String,dynamic>{};
      mappedJson['fullName'] = updateProfileResponse.fullName;
      mappedJson['email'] = updateProfileResponse.email;
      mappedJson['mobileNumber'] = updateProfileResponse.mobileNumber;
      mappedJson['grade'] = updateProfileResponse.grade;
      mappedJson['referralCode'] = updateProfileResponse.referralCode;
      mappedJson['role'] = updateProfileResponse.role;
      mappedJson['avatarUrl'] = updateProfileResponse.avatarUrl;
      mappedJson['isPremium'] = updateProfileResponse.isPremium;
      mappedJson['isVerified'] = updateProfileResponse.isVerified;
      mappedJson['country'] = updateProfileResponse.country;
      mappedJson['gender'] = updateProfileResponse.gender;
      mappedJson['dateOfBirth'] = updateProfileResponse.dateOfBirth;
      mappedJson['governorate'] = updateProfileResponse.governorate;
      mappedJson['accessToken'] = sharedAppUserEntity?.accessToken;
      mappedJson['referralCode'] = sharedAppUserEntity?.referralCode;
      await addAsJsonAsync(mappedJson);
    }
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
        gender: mappedJson["gender"] ?? sharedAppUserEntity?.gender,
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
