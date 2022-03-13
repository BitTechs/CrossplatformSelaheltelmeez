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
  final String dateOfBirth= "";
  final int grade;
  final int identityRoleId;
  final int countryId;
  final int governorateId;
  final int gender;
  final bool isEmailSubscribed;
  RegisterRequest({required this.fullName, required this.grade, required this.identityRoleId, required this.countryId, required this.governorateId, required this.gender, required this.isEmailSubscribed,required this.email, required this.mobileNumber, required this.passwordHash, required this.googleId, this.facebookId, required this.officeId,});
  factory RegisterRequest.fromJson(Map<String,dynamic> json)=> _$RegisterRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$RegisterRequestToJson(this);
}