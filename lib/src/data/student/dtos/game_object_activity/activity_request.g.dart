// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRequest _$ActivityRequestFromJson(Map<String, dynamic> json) =>
    ActivityRequest(
      clipId: json['clipId'] as int,
      lessonId: json['lessonId'] as int,
    );

Map<String, dynamic> _$ActivityRequestToJson(ActivityRequest instance) =>
    <String, dynamic>{
      'clipId': instance.clipId,
      'lessonId': instance.lessonId,
    };
