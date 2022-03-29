import 'package:json_annotation/json_annotation.dart';
part 'student_curriculum.g.dart';

@JsonSerializable()
class StudentCurriculum{
  final String? id;
  final String? name;
  final String? backgroundImage;
  final String? icon;
  final int? term;
  StudentCurriculum( {this.id, this.name, this.backgroundImage, this.icon, this.term});

  factory StudentCurriculum.fromJson(Map<String,dynamic> json)=> _$StudentCurriculumFromJson(json);
  Map<String,dynamic> toJson()=> _$StudentCurriculumToJson(this);
}