import 'package:json_annotation/json_annotation.dart';
part 'validate_otp_request.g.dart';

@JsonSerializable()
class ValidateOTPRequest{
  final String code;
  ValidateOTPRequest({required this.code});

  factory ValidateOTPRequest.fromJson(Map<String,dynamic> json)=> _$ValidateOTPRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$ValidateOTPRequestToJson(this);

}