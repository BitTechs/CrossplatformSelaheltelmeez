import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_response.dart';


class RemoteLoginDataProvider {
  final IDioClient dioClient;
  RemoteLoginDataProvider({required this.dioClient});

  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async {
    Response<dynamic> responseResult = await dioClient.getClient().post("/Identity/Login", data: request);
    return ValueCommitResult<LoginResponse>.fromJson(responseResult.data,(data)=> LoginResponse.fromJson(data as Map<String,dynamic>));
  }
}