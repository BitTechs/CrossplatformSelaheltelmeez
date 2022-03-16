// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      isVerified: json['isVerified'] as bool,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      grade: json['grade'] as String,
      country: json['country'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      referralCode: json['referralCode'] as String,
      role: json['role'] as String,
      governorate: json['governorate'] as String,
      avatarUrl: json['avatarUrl'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      isPremium: json['isPremium'] as bool,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'grade': instance.grade,
      'country': instance.country,
      'dateOfBirth': instance.dateOfBirth,
      'referralCode': instance.referralCode,
      'role': instance.role,
      'governorate': instance.governorate,
      'avatarUrl': instance.avatarUrl,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'isPremium': instance.isPremium,
      'isVerified': instance.isVerified,
    };
