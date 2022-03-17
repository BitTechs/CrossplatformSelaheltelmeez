import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';

class CurriculumDataProvider{
  Future<Response<dynamic>> getStudentCurriculumsAsync(String accessToken) async {
    Dio dioClient = await DioClient.getHttpClient(accessToken);
    return await dioClient.get("/Curriculum/GetStudentCurriculums");
  }
}