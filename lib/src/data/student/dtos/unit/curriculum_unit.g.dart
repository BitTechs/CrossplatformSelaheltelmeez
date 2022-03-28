// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurriculumUnit _$CurriculumUnitFromJson(Map<String, dynamic> json) =>
    CurriculumUnit(
      json['id'] as int,
      json['name'] as String,
      (json['lessons'] as List<dynamic>)
          .map((e) => UnitLesson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurriculumUnitToJson(CurriculumUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lessons': instance.lessons,
    };
