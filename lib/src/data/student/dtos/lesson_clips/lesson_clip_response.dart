import 'package:json_annotation/json_annotation.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/clip_type.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/game_object_clip.dart';
part 'lesson_clip_response.g.dart';

@JsonSerializable()
class LessonClipResponse{
  final List<ClipType> types;
  final List<GameObjectClip> clips;
  LessonClipResponse(this.types, this.clips);
  factory LessonClipResponse.fromJson(Map<String,dynamic> json)=> _$LessonClipResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$LessonClipResponseToJson(this);

}