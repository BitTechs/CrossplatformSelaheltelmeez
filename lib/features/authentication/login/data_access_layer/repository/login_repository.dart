import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/login_response.dart';

class LoginRepository {
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async {
    Dio dioClient = await DioClient.getHttpClient();
    Response<dynamic> responseResult = await dioClient.post("/Auth/Login", data: request);
    return ValueCommitResult<LoginResponse>.fromJson(responseResult.data,  (json)=> LoginResponse.fromJson(json));
  }
}
