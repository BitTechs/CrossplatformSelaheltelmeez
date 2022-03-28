import 'package:selaheltelmeez/core/local_storage/entities/app_user_entity.dart';
import 'package:selaheltelmeez/core/local_storage/object_box_db.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_response.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/update_profile/update_profile_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUserRepository{
  final ObjectBox objectBox;
  final SharedPreferences sharedPreferenceInstance;
  static const String appUserId = "App_User_Id_Key";
  AppUserRepository({required this.objectBox, required this.sharedPreferenceInstance});
  void saveLoginResponse(LoginResponse response){
    final userBox = objectBox.store.box<AppUserEntity>();
    int internalAppUserId = userBox.put(AppUserEntity(
        appUserId:  response.id,
        isEmailVerified: response.isEmailVerified,
        isMobileVerified: response.isMobileVerified,
        fullName: response.fullName,
        email: response.email,
        mobileNumber: response.mobileNumber,
        grade: response.grade,
        gender: response.gender,
        country: response.country,
        dateOfBirth: response.dateOfBirth,
        referralCode: response.referralCode,
        role: response.role,
        governorate: response.governorate,
        avatarUrl: response.avatarUrl,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        isPremium: response.isPremium));
    sharedPreferenceInstance.setInt(appUserId, internalAppUserId);
  }
  void saveRegisterResponse(RegisterResponse response){
    final userBox = objectBox.store.box<AppUserEntity>();
    int internalAppUserId = userBox.put(AppUserEntity(
        appUserId:  response.id,
        isEmailVerified: response.isEmailVerified,
        isMobileVerified: response.isMobileVerified,
        fullName: response.fullName,
        email: response.email,
        mobileNumber: response.mobileNumber,
        grade: response.grade,
        referralCode: response.referralCode,
        role: response.role,
        avatarUrl: response.avatarUrl,
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        isPremium: response.isPremium));
    sharedPreferenceInstance.setInt(appUserId, internalAppUserId);
  }
  void saveUpdateProfileResponse(UpdateProfileResponse response){
    final userBox = objectBox.store.box<AppUserEntity>();
    int internalAppUserId = userBox.put(AppUserEntity(
        appUserId:  response.id,
        isEmailVerified: response.isEmailVerified,
        isMobileVerified: response.isMobileVerified,
        fullName: response.fullName,
        email: response.email,
        mobileNumber: response.mobileNumber,
        grade: response.grade,
        gender: response.gender,
        country: response.country,
        dateOfBirth: response.dateOfBirth,
        referralCode: response.referralCode,
        role: response.role,
        governorate: response.governorate,
        avatarUrl: response.avatarUrl,
        isPremium: response.isPremium));
    sharedPreferenceInstance.setInt(appUserId, internalAppUserId);
  }

  AppUserEntity? getAppUser(){
    int? internalAppUserId = sharedPreferenceInstance.getInt(appUserId);
    if(internalAppUserId != null){
      final appUserBox = objectBox.store.box<AppUserEntity>();
      return appUserBox.get(internalAppUserId);
    }
    return null;
  }
  void update(AppUserEntity entity){
    int? internalAppUserId = sharedPreferenceInstance.getInt(appUserId);
    if(internalAppUserId != null){
      final appUserBox = objectBox.store.box<AppUserEntity>();
       appUserBox.put(entity);
    }
  }

  bool remove(){
    int? internalAppUserId = sharedPreferenceInstance.getInt(appUserId);
    if(internalAppUserId != null){
      final appUserBox = objectBox.store.box<AppUserEntity>();
      return appUserBox.remove(internalAppUserId);
    }
    return false;
  }
}