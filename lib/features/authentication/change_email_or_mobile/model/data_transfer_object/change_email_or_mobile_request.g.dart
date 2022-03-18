// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_email_or_mobile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeEmailOrMobileRequest _$ChangeEmailOrMobileRequestFromJson(
        Map<String, dynamic> json) =>
    ChangeEmailOrMobileRequest(
      newEmail: json['newEmail'] as String?,
      newMobileNumber: json['newMobileNumber'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$ChangeEmailOrMobileRequestToJson(
        ChangeEmailOrMobileRequest instance) =>
    <String, dynamic>{
      'newEmail': instance.newEmail,
      'newMobileNumber': instance.newMobileNumber,
      'password': instance.password,
    };
