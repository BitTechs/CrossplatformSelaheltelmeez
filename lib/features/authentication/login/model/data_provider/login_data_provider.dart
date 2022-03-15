import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';

class LoginDataProvider{
  Future<Response<dynamic>> loginAsync(LoginRequest request) async {
    Dio dioClient = await DioClient.getHttpClient();
    return await dioClient.post("/Identity/Login", data: request);
  }
}