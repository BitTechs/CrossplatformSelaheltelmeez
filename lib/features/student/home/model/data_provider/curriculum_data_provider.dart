import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';

class CurriculumDataProvider{
  Future<Response<dynamic>> getStudentCurriculumsAsync() async {
    Dio dioClient = await DioClient.getHttpClient();
    return await dioClient.get("/Curriculum/GetStudentCurriculums");
  }
}