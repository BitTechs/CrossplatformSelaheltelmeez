import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/student/home/model/data_provider/curriculum_data_provider.dart';
import 'package:selaheltelmeez/features/student/home/model/data_transfer_object/curriculum/student_curriculum.dart';

class CurriculumRepository {
  final CurriculumDataProvider dataProvider;
  CurriculumRepository({required this.dataProvider});
/*
  Future<RecentLessonCommitResult> getRecentLessonsAsync() async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult = await dioClient.get("/Student/RecentLessons");
    return RecentLessonCommitResult.fromJson(responseResult.data);
  }
*/

  Future<ValueCommitResult<List<StudentCurriculum>>> getCurriculumsAsync(String accessToken) async {
    Response<dynamic> responseResult = await dataProvider.getStudentCurriculumsAsync(accessToken);
    return ValueCommitResult<List<StudentCurriculum>>.fromJson(responseResult.data,(data)=> (data as List).map((e) => StudentCurriculum.fromJson(e as Map<String,dynamic>)).toList());
  }
}
