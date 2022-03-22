import 'package:json_annotation/json_annotation.dart';
part 'grade_menu_item.g.dart';

@JsonSerializable()
class GradeMenuItem{
  final int id;
  final String name;
  GradeMenuItem({required this.id, required this.name});
  factory GradeMenuItem.fromJson(Map<String,dynamic> json)=> _$GradeMenuItemFromJson(json);
  Map<String,dynamic> toJson()=> _$GradeMenuItemToJson(this);
}