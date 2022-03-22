import 'package:json_annotation/json_annotation.dart';
part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequest{
  late String? email= "";
  late String? mobileNumber= "";
  ForgetPasswordRequest({this.email, this.mobileNumber});
  factory ForgetPasswordRequest.fromJson(Map<String,dynamic> json)=> _$ForgetPasswordRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$ForgetPasswordRequestToJson(this);
}