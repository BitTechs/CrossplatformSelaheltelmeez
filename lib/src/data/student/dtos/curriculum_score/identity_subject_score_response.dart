import 'package:json_annotation/json_annotation.dart';
part 'identity_subject_score_response.g.dart';

@JsonSerializable()
class IdentitySubjectScoreResponse{
  final int subjectScore;
  final int studentScore;
  IdentitySubjectScoreResponse(this.subjectScore, this.studentScore);
  factory IdentitySubjectScoreResponse.fromJson(Map<String,dynamic> json)=> _$IdentitySubjectScoreResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$IdentitySubjectScoreResponseToJson(this);

}