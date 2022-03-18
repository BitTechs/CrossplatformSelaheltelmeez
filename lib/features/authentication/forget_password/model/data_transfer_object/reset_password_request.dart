import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest{
  final String identityUserId;
  final String newPassword;
  ResetPasswordRequest({required this.identityUserId, required this.newPassword});
  factory ResetPasswordRequest.fromJson(Map<String,dynamic> json)=> _$ResetPasswordRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$ResetPasswordRequestToJson(this);
}