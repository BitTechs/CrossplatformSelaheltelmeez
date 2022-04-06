// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_invitation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityInvitationResponse _$IdentityInvitationResponseFromJson(
        Map<String, dynamic> json) =>
    IdentityInvitationResponse(
      json['invitationId'] as int,
      json['description'] as String,
      json['isNew'] as bool,
      json['isSeen'] as bool,
      json['status'] as int,
      json['avatarUrl'] as String,
      json['createdOn'] as String,
    );

Map<String, dynamic> _$IdentityInvitationResponseToJson(
        IdentityInvitationResponse instance) =>
    <String, dynamic>{
      'invitationId': instance.invitationId,
      'description': instance.description,
      'isNew': instance.isNew,
      'isSeen': instance.isSeen,
      'status': instance.status,
      'avatarUrl': instance.avatarUrl,
      'createdOn': instance.createdOn,
    };
