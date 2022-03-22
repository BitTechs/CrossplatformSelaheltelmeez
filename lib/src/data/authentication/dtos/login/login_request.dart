import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest{
  late String? email= "";
  late String? mobileNumber= "";
  late String passwordHash;
  late String? googleId = "";
  late String? facebookId= "";
  late String? officeId= "";
  LoginRequest({this.email, this.mobileNumber, required this.passwordHash, this.googleId, this.facebookId, this.officeId,});
  factory LoginRequest.fromJson(Map<String,dynamic> json)=> _$LoginRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$LoginRequestToJson(this);
}