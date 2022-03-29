// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_clip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonClipResponse _$LessonClipResponseFromJson(Map<String, dynamic> json) =>
    LessonClipResponse(
      (json['types'] as List<dynamic>)
          .map((e) => ClipType.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['clips'] as List<dynamic>)
          .map((e) => GameObjectClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LessonClipResponseToJson(LessonClipResponse instance) =>
    <String, dynamic>{
      'types': instance.types,
      'clips': instance.clips,
    };
