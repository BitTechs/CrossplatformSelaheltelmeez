import 'package:flutter/material.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_entity.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';

class AppUserProvider extends ChangeNotifier {
  late AppUserEntity _appUserEntity;

  AppUserEntity get getAppUser => _appUserEntity;

  void setAppUserProvider(Map<String, dynamic> mappedJson) {
    _appUserEntity = AppUserEntity(
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
    notifyListeners();
  }

  Future<void> loadFromSharedPreference() async {
    Map<String, dynamic> result =
        await AppUserLocalStorageProvider.readAsJsonAsync();
    setAppUserProvider(result);
  }

  void updateAppUserProvider(AppUserEntity appUserEntity) => _appUserEntity = appUserEntity;
}
