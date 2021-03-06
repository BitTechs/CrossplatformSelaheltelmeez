// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      id: json['id'] as String,
      isMobileVerified: json['isMobileVerified'] as bool,
      isEmailVerified: json['isEmailVerified'] as bool,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      grade: json['grade'] as String?,
      referralCode: json['referralCode'] as String,
      role: json['role'] as String,
      avatarUrl: json['avatarUrl'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      isPremium: json['isPremium'] as bool,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'grade': instance.grade,
      'referralCode': instance.referralCode,
      'role': instance.role,
      'avatarUrl': instance.avatarUrl,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'isPremium': instance.isPremium,
      'isEmailVerified': instance.isEmailVerified,
      'isMobileVerified': instance.isMobileVerified,
    };
