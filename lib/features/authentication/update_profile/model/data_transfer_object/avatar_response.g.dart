// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvatarResponse _$AvatarResponseFromJson(Map<String, dynamic> json) =>
    AvatarResponse(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$AvatarResponseToJson(AvatarResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'isSelected': instance.isSelected,
    };
