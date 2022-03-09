import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/recent_lesson/recent_lesson_commit_result.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/subject/subject_i_enumerable_commit_result.dart';

class StudentHomeRepository {

  Future<RecentLessonCommitResult> getRecentLessonsAsync() async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult = await dioClient.get("/Student/RecentLessons");
    return RecentLessonCommitResult.fromJson(responseResult.data);
  }

  Future<SubjectIEnumerableCommitResult> getSubjectsAsync() async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult = await dioClient.get("/Student/Subject");
    return SubjectIEnumerableCommitResult.fromJson(responseResult.data);
  }
}
