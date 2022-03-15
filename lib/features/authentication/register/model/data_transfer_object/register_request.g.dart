// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      fullName: json['fullName'] as String,
      grade: json['grade'] as int,
      identityRoleId: json['identityRoleId'] as int,
      countryId: json['countryId'] as int,
      governorateId: json['governorateId'] as int,
      gender: json['gender'] as int,
      isEmailSubscribed: json['isEmailSubscribed'] as bool,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      passwordHash: json['passwordHash'] as String,
      googleId: json['googleId'] as String?,
      facebookId: json['facebookId'] as String?,
      officeId: json['officeId'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'passwordHash': instance.passwordHash,
      'googleId': instance.googleId,
      'facebookId': instance.facebookId,
      'officeId': instance.officeId,
      'grade': instance.grade,
      'identityRoleId': instance.identityRoleId,
      'countryId': instance.countryId,
      'governorateId': instance.governorateId,
      'gender': instance.gender,
      'isEmailSubscribed': instance.isEmailSubscribed,
    };