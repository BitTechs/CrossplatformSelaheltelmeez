import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';

class RegisterRemoteDataProvider{
  Future<Response<dynamic>> registerAsync(RegisterRequest request) async {
    Dio dioClient = await DioClient.getHttpClient();
    return await dioClient.post("/Identity/Register", data: request);
  }
}