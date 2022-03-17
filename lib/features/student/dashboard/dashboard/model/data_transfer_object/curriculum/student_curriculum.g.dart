// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_curriculum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentCurriculum _$StudentCurriculumFromJson(Map<String, dynamic> json) =>
    StudentCurriculum(
      id: json['id'] as String?,
      name: json['name'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      term: json['term'] as int?,
    );

Map<String, dynamic> _$StudentCurriculumToJson(StudentCurriculum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backgroundImage': instance.backgroundImage,
      'backgroundColor': instance.backgroundColor,
      'term': instance.term,
    };
