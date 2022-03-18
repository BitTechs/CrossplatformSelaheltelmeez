// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequest(
      dateOfBirth: json['dateOfBirth'] as String?,
      avatarId: json['avatarId'] as int?,
      countryId: json['countryId'] as int?,
      governorateId: json['governorateId'] as int?,
      gender: json['gender'] as int?,
      isEmailSubscribed: json['isEmailSubscribed'] as bool?,
    );

Map<String, dynamic> _$UpdateProfileRequestToJson(
        UpdateProfileRequest instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'governorateId': instance.governorateId,
      'gender': instance.gender,
      'isEmailSubscribed': instance.isEmailSubscribed,
      'dateOfBirth': instance.dateOfBirth,
      'avatarId': instance.avatarId,
    };
