import 'package:json_annotation/json_annotation.dart';
part 'activity_request.g.dart';

@JsonSerializable()
class ActivityRequest{
  final int clipId;
  final int lessonId;
  final String subjectId;
  ActivityRequest({required this.clipId, required this.lessonId, required this.subjectId});
  factory ActivityRequest.fromJson(Map<String,dynamic> json)=> _$ActivityRequestFromJson(json);
  Map<String,dynamic> toJson()=> _$ActivityRequestToJson(this);
}
