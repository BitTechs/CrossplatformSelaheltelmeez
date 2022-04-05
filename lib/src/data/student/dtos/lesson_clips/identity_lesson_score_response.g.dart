// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_lesson_score_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityLessonScoreResponse _$IdentityLessonScoreResponseFromJson(
        Map<String, dynamic> json) =>
    IdentityLessonScoreResponse(
      json['lessonScore'] as int,
      json['studentScore'] as int,
    );

Map<String, dynamic> _$IdentityLessonScoreResponseToJson(
        IdentityLessonScoreResponse instance) =>
    <String, dynamic>{
      'lessonScore': instance.lessonScore,
      'studentScore': instance.studentScore,
    };
