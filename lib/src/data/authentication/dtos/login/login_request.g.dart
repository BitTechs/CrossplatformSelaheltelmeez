// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      passwordHash: json['passwordHash'] as String,
      googleId: json['googleId'] as String?,
      facebookId: json['facebookId'] as String?,
      officeId: json['officeId'] as String?,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'passwordHash': instance.passwordHash,
      'googleId': instance.googleId,
      'facebookId': instance.facebookId,
      'officeId': instance.officeId,
    };
