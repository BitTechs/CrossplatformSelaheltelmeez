import 'package:json_annotation/json_annotation.dart';
part 'unit_lesson.g.dart';

@JsonSerializable()
class UnitLesson {
  final int id;
  final String name;
  UnitLesson(this.id, this.name);
  factory UnitLesson.fromJson(Map<String,dynamic> json)=> _$UnitLessonFromJson(json);
  Map<String,dynamic> toJson()=> _$UnitLessonToJson(this);
}