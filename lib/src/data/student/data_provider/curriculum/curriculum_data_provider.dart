import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum_score/identity_subject_score_response.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/identity_lesson_score_response.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/lesson_clip_response.dart';
import 'package:selaheltelmeez/src/data/student/dtos/recent_progress/student_recent_lesson_progress_response.dart';
import 'package:selaheltelmeez/src/data/student/dtos/unit/curriculum_unit.dart';

class CurriculumDataProvider {
  final IDioClient dioClient;
  CurriculumDataProvider({required this.dioClient});

  Future<ValueCommitResult<List<StudentCurriculum>>> getStudentCurriculumsAsync() async{
    Response<dynamic> response = await dioClient.getClient().get("/StudentCurriculum/GetStudentSubjects");
    return ValueCommitResult<List<StudentCurriculum>>.fromJson(response.data,(data)=> (data as List).map((e) => StudentCurriculum.fromJson(e as Map<String,dynamic>)).toList());
   }

  Future<ValueCommitResult<List<StudentRecentLessonProgressResponse>>> getRecentLessonsProgressAsync() async{
    Response<dynamic> response = await dioClient.getClient().get("/StudentActivityTracker/GetRecentLessonProgress");
    return ValueCommitResult<List<StudentRecentLessonProgressResponse>>.fromJson(response.data,(data)=> (data as List).map((e) => StudentRecentLessonProgressResponse.fromJson(e as Map<String,dynamic>)).toList());
  }

  Future<ValueCommitResult<List<CurriculumUnit>>> getCurriculumUnitsAsync(String curriculumId)async{
    Response<dynamic> response = await dioClient.getClient().get("/Curriculum/GetUnits?SubjectId=$curriculumId");
    return ValueCommitResult<List<CurriculumUnit>>.fromJson(response.data,(data)=> (data as List).map((e) => CurriculumUnit.fromJson(e as Map<String,dynamic>)).toList());
  }

  Future<ValueCommitResult<LessonClipResponse>> getLessonClipsAsync(int lessonId) async{
    Response<dynamic> response = await dioClient.getClient().get("/Curriculum/GetClips?LessonId=$lessonId");
    return ValueCommitResult<LessonClipResponse>.fromJson(response.data,(data)=> LessonClipResponse.fromJson(data as Map<String,dynamic>));
  }

  Future<ValueCommitResult<IdentitySubjectScoreResponse>> getSubjectScoreAsync(String subjectId) async {
    Response<dynamic> response = await dioClient.getClient().get("/StudentActivityTracker/GetIdentitySubjectScore?SubjectId=$subjectId");
    return ValueCommitResult<IdentitySubjectScoreResponse>.fromJson(response.data,(data)=> IdentitySubjectScoreResponse.fromJson(data as Map<String,dynamic>));
  }
  Future<ValueCommitResult<IdentityLessonScoreResponse>> getLessonScoreAsync(int lessonId) async {
    Response<dynamic> response = await dioClient.getClient().get("/StudentActivityTracker/GetIdentityClipsScore?LessonId=$lessonId");
    return ValueCommitResult<IdentityLessonScoreResponse>.fromJson(response.data,(data)=> IdentityLessonScoreResponse.fromJson(data as Map<String,dynamic>));
  }
}
