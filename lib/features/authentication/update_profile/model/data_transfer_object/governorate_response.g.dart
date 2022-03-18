// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernorateResponse _$GovernorateResponseFromJson(Map<String, dynamic> json) =>
    GovernorateResponse(
      id: json['id'] as int,
      name: json['name'] as String,
    )..isSelected = json['isSelected'] as bool?;

Map<String, dynamic> _$GovernorateResponseToJson(
        GovernorateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected,
    };
