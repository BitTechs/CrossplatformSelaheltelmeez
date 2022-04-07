import 'package:json_annotation/json_annotation.dart';
part 'game_object_clip.g.dart';

@JsonSerializable()
class GameObjectClip{
  final int id;
  final String clipName;
  final int? clipType;
  final int lessonId;
  final String thumbnail;
  final int clipScore;
  final int width;
  final int height;
  final String gameObjectUrl;
  final bool isPremiumOnly;
  final int orientation;
  final int studentScore;
  late int? activityId;
  final int? gameObjectCode;
  final int? gameObjectProgress;
  final int? gameObjectLearningDurationInSec;
  GameObjectClip(this.id, this.clipName, this.clipType, this.thumbnail, this.clipScore, this.width, this.height, this.gameObjectUrl, this.isPremiumOnly, this.orientation, this.lessonId, this.studentScore, this.activityId, this.gameObjectCode, this.gameObjectProgress, this.gameObjectLearningDurationInSec);

  factory GameObjectClip.fromJson(Map<String,dynamic> json)=> _$GameObjectClipFromJson(json);
  Map<String,dynamic> toJson()=> _$GameObjectClipToJson(this);

}