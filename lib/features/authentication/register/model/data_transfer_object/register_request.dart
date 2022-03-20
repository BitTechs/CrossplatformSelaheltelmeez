import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest{
  final String fullName;
  final String? email;
  final String? mobileNumber;
  final String passwordHash;
  final String? googleId;
  final String? facebookId;
  final String? officeId;
  final int? grade;
  final int identityRoleId;

  RegisterRequest({required this.identityRoleId, required this.fullName, this.grade,required this.email, required this.mobileNumber, required this.passwordHash, required this.googleId, this.facebookId, required this.officeId,});
  factory RegisterRequest.fromJson(Map<String,dynamic> json)=> _$RegisterRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$RegisterRequestToJson(this);
}

