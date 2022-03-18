import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest{
  final int? countryId;
  final int? governorateId;
  final int? gender;
  final bool? isEmailSubscribed;
  final String? dateOfBirth;
  final int? avatarId;
  UpdateProfileRequest({required this.dateOfBirth, required this.avatarId, required this.countryId, required this.governorateId, required this.gender, required this.isEmailSubscribed});
  factory UpdateProfileRequest.fromJson(Map<String,dynamic> json)=> _$UpdateProfileRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$UpdateProfileRequestToJson(this);
}