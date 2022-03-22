import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/curriculum/i_curriculum_data_provider.dart';

class CurriculumDataProvider implements ICurriculumDataProvider {
  final IDioClient dioClient;
  CurriculumDataProvider({required this.dioClient});

  @override
  Future<ValueCommitResult<List<StudentCurriculum>>> getStudentCurriculumsAsync() async{
    Response<dynamic> response = await dioClient.getClient().get("/Curriculum/GetStudentCurriculums");
    return ValueCommitResult<List<StudentCurriculum>>.fromJson(response.data,(data)=> (data as List).map((e) => StudentCurriculum.fromJson(e as Map<String,dynamic>)).toList());
   }
}
