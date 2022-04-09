// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateActivityRequest _$UpdateActivityRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateActivityRequest(
      learningDurationInSec: json['learningDurationInSec'] as int,
      code: json['code'] as int,
      activityId: json['activityId'] as int,
      studentPoints: (json['studentPoints'] as num).toDouble(),
    );

Map<String, dynamic> _$UpdateActivityRequestToJson(
        UpdateActivityRequest instance) =>
    <String, dynamic>{
      'learningDurationInSec': instance.learningDurationInSec,
      'code': instance.code,
      'activityId': instance.activityId,
      'studentPoints': instance.studentPoints,
    };
