import 'package:json_annotation/json_annotation.dart';
part 'identity_invitation_response.g.dart';

@JsonSerializable()
class IdentityInvitationResponse{
  final int invitationId;
  final String description;
  final bool isNew;
  final bool isSeen;
  final int status;
  final String avatarUrl;
  final String createdOn;
  IdentityInvitationResponse(this.invitationId, this.description, this.isNew, this.isSeen, this.status, this.avatarUrl, this.createdOn);
  factory IdentityInvitationResponse.fromJson(Map<String,dynamic> json)=> _$IdentityInvitationResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$IdentityInvitationResponseToJson(this);
}