import 'package:json_annotation/json_annotation.dart';
part 'identity_lesson_score_response.g.dart';

@JsonSerializable()
class IdentityLessonScoreResponse{
  final int lessonScore;
  final int studentScore;
  IdentityLessonScoreResponse(this.lessonScore, this.studentScore);
  factory IdentityLessonScoreResponse.fromJson(Map<String,dynamic> json)=> _$IdentityLessonScoreResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$IdentityLessonScoreResponseToJson(this);
}