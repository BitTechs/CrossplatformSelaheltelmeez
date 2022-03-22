// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponse _$UpdateProfileResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileResponse(
      gender: json['gender'] as String?,
      isVerified: json['isVerified'] as bool,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      grade: json['grade'] as String?,
      country: json['country'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      referralCode: json['referralCode'] as String,
      role: json['role'] as String,
      governorate: json['governorate'] as String?,
      avatarUrl: json['avatarUrl'] as String,
      isPremium: json['isPremium'] as bool,
    );

Map<String, dynamic> _$UpdateProfileResponseToJson(
        UpdateProfileResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'grade': instance.grade,
      'country': instance.country,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'referralCode': instance.referralCode,
      'role': instance.role,
      'governorate': instance.governorate,
      'avatarUrl': instance.avatarUrl,
      'isPremium': instance.isPremium,
      'isVerified': instance.isVerified,
    };
