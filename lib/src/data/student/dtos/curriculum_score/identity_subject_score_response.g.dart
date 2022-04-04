// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_subject_score_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentitySubjectScoreResponse _$IdentitySubjectScoreResponseFromJson(
        Map<String, dynamic> json) =>
    IdentitySubjectScoreResponse(
      json['subjectScore'] as int,
      json['studentScore'] as int,
    );

Map<String, dynamic> _$IdentitySubjectScoreResponseToJson(
        IdentitySubjectScoreResponse instance) =>
    <String, dynamic>{
      'subjectScore': instance.subjectScore,
      'studentScore': instance.studentScore,
    };
