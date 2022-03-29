import 'package:json_annotation/json_annotation.dart';
part 'clip_type.g.dart';

@JsonSerializable()
class ClipType{
  final String? name;
  final String? imageUrl;
  final int? value;
  ClipType(this.name, this.imageUrl, this.value);
  factory ClipType.fromJson(Map<String,dynamic> json)=> _$ClipTypeFromJson(json);
  Map<String,dynamic> toJson()=> _$ClipTypeToJson(this);
}