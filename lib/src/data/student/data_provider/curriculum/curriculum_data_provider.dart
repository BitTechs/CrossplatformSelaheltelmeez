import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';
import 'package:selaheltelmeez/src/data/student/dtos/recent_progress/student_recent_lesson_progress_response.dart';

class CurriculumDataProvider {
  final IDioClient dioClient;
  CurriculumDataProvider({required this.dioClient});

  Future<ValueCommitResult<List<StudentCurriculum>>> getStudentCurriculumsAsync() async{
    Response<dynamic> response = await dioClient.getClient().get("/StudentCurriculum/GetStudentCurriculums");
    return ValueCommitResult<List<StudentCurriculum>>.fromJson(response.data,(data)=> (data as List).map((e) => StudentCurriculum.fromJson(e as Map<String,dynamic>)).toList());
   }

  Future<ValueCommitResult<List<StudentRecentLessonProgressResponse>>> getRecentLessonsProgressAsync() async{
    Response<dynamic> response = await dioClient.getClient().get("/StudentCurriculum/GetStudentRecentLessonsProgress");
    return ValueCommitResult<List<StudentRecentLessonProgressResponse>>.fromJson(response.data,(data)=> (data as List).map((e) => StudentRecentLessonProgressResponse.fromJson(e as Map<String,dynamic>)).toList());
  }
}
