import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse{
  final String fullName;
  final String? email;
  final String? mobileNumber;
  final String grade;
  final String country;
  final String dateOfBirth;
  final String referralCode;
  final String role;
  final String governorate;
  final String avatarUrl;
  final String accessToken;
  final String refreshToken;
  final bool isPremium;
  RegisterResponse({required this.fullName, required this.email, required this.mobileNumber, required this.grade, required this.country, required this.dateOfBirth, required this.referralCode, required this.role, required this.governorate, required this.avatarUrl, required this.accessToken, required this.refreshToken, required this.isPremium});
  factory RegisterResponse.fromJson(Map<String,dynamic> json)=> _$RegisterResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$RegisterResponseToJson(this);
}