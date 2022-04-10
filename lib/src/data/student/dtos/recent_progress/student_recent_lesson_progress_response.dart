import 'package:json_annotation/json_annotation.dart';
part 'student_recent_lesson_progress_response.g.dart';

@JsonSerializable()
class StudentRecentLessonProgressResponse{
  final String lessonName;
  final int lessonPoints;
  final double studentPoints;
  final double progress;
  StudentRecentLessonProgressResponse(this.lessonName, this.lessonPoints, this.studentPoints, this.progress);

  factory StudentRecentLessonProgressResponse.fromJson(Map<String,dynamic> json)=> _$StudentRecentLessonProgressResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$StudentRecentLessonProgressResponseToJson(this);
}