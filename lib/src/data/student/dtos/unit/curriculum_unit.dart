import 'package:json_annotation/json_annotation.dart';
import 'package:selaheltelmeez/src/data/student/dtos/unit/unit_lesson.dart';
part 'curriculum_unit.g.dart';

@JsonSerializable()
class CurriculumUnit{
  final int id;
  final String name;
  final List<UnitLesson> lessons;
  CurriculumUnit(this.id, this.name, this.lessons);
  factory CurriculumUnit.fromJson(Map<String,dynamic> json)=> _$CurriculumUnitFromJson(json);
  Map<String,dynamic> toJson()=> _$CurriculumUnitToJson(this);
}