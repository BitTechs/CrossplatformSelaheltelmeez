import 'package:json_annotation/json_annotation.dart';
part 'confirm_otp_code_request.g.dart';
@JsonSerializable()
class ConfirmOTPCodeRequest{
  final String code;
  ConfirmOTPCodeRequest(this.code);

  factory ConfirmOTPCodeRequest.fromJson(Map<String,dynamic> json)=> _$ConfirmOTPCodeRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$ConfirmOTPCodeRequestToJson(this);

}