// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_recent_lesson_progress_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentRecentLessonProgressResponse
    _$StudentRecentLessonProgressResponseFromJson(Map<String, dynamic> json) =>
        StudentRecentLessonProgressResponse(
          json['lessonName'] as String,
          json['lessonPoints'] as int,
          json['studentPoints'] as int,
          (json['progress'] as num).toDouble(),
        );

Map<String, dynamic> _$StudentRecentLessonProgressResponseToJson(
        StudentRecentLessonProgressResponse instance) =>
    <String, dynamic>{
      'lessonName': instance.lessonName,
      'lessonPoints': instance.lessonPoints,
      'studentPoints': instance.studentPoints,
      'progress': instance.progress,
    };
