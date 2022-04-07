// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_object_clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameObjectClip _$GameObjectClipFromJson(Map<String, dynamic> json) =>
    GameObjectClip(
      json['id'] as int,
      json['clipName'] as String,
      json['clipType'] as int?,
      json['thumbnail'] as String,
      json['clipScore'] as int,
      json['width'] as int,
      json['height'] as int,
      json['gameObjectUrl'] as String,
      json['isPremiumOnly'] as bool,
      json['orientation'] as int,
      json['lessonId'] as int,
      json['studentScore'] as int,
      json['activityId'] as int?,
      json['gameObjectCode'] as int?,
      json['gameObjectProgress'] as int?,
      json['gameObjectLearningDurationInSec'] as int?,
    );

Map<String, dynamic> _$GameObjectClipToJson(GameObjectClip instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clipName': instance.clipName,
      'clipType': instance.clipType,
      'lessonId': instance.lessonId,
      'thumbnail': instance.thumbnail,
      'clipScore': instance.clipScore,
      'width': instance.width,
      'height': instance.height,
      'gameObjectUrl': instance.gameObjectUrl,
      'isPremiumOnly': instance.isPremiumOnly,
      'orientation': instance.orientation,
      'studentScore': instance.studentScore,
      'activityId': instance.activityId,
      'gameObjectCode': instance.gameObjectCode,
      'gameObjectProgress': instance.gameObjectProgress,
      'gameObjectLearningDurationInSec':
          instance.gameObjectLearningDurationInSec,
    };
