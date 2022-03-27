import 'package:json_annotation/json_annotation.dart';
part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse{
  final String id;
  final String fullName;
  final String? email;
  final String? mobileNumber;
  final String? grade;
  final String? gender;
  final String? country;
  final String? dateOfBirth;
  final String referralCode;
  final String role;
  final String? governorate;
  final String avatarUrl;
  final String accessToken;
  final String refreshToken;
  final bool isPremium;
  final bool isEmailVerified;
  final bool isMobileVerified;
  UpdateProfileResponse( {required this.id,required this.gender,required this.isEmailVerified,required this.isMobileVerified,required this.fullName, required this.email, required this.mobileNumber, required this.grade, required this.country, required this.dateOfBirth, required this.referralCode, required this.role, required this.governorate, required this.avatarUrl, required this.accessToken, required this.refreshToken, required this.isPremium});
  factory UpdateProfileResponse.fromJson(Map<String,dynamic> json)=> _$UpdateProfileResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$UpdateProfileResponseToJson(this);
}