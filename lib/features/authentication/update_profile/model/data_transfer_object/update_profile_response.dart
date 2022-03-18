import 'package:json_annotation/json_annotation.dart';
part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse{
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
  final bool isPremium;
  final bool isVerified;
  UpdateProfileResponse({required this.isVerified,required this.fullName, required this.email, required this.mobileNumber, required this.grade, required this.country, required this.dateOfBirth, required this.referralCode, required this.role, required this.governorate, required this.avatarUrl, required this.isPremium});
  factory UpdateProfileResponse.fromJson(Map<String,dynamic> json)=> _$UpdateProfileResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$UpdateProfileResponseToJson(this);
}