import 'package:json_annotation/json_annotation.dart';
part 'change_email_or_mobile_request.g.dart';

@JsonSerializable()
class ChangeEmailOrMobileRequest{
  late String? newEmail= "";
  late String? newMobileNumber= "";
  late String password;
  ChangeEmailOrMobileRequest({this.newEmail, this.newMobileNumber, required this.password});
  factory ChangeEmailOrMobileRequest.fromJson(Map<String,dynamic> json)=> _$ChangeEmailOrMobileRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$ChangeEmailOrMobileRequestToJson(this);
}