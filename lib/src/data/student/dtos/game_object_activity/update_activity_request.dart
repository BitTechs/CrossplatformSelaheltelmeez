import 'package:json_annotation/json_annotation.dart';
part 'update_activity_request.g.dart';

@JsonSerializable()
class UpdateActivityRequest{
  final int learningDurationInSec;
  final int code;
  final int activityId;
  final double studentPoints;
  UpdateActivityRequest({required this.learningDurationInSec, required this.code, required this.activityId, required this.studentPoints});
  factory UpdateActivityRequest.fromJson(Map<String,dynamic> json)=> _$UpdateActivityRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$UpdateActivityRequestToJson(this);
}