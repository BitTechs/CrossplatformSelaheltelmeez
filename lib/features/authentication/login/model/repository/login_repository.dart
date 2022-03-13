import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/remote_data_provider/login_remote_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_response.dart';

class LoginRepository {
  final LoginRemoteDataProvider remoteDataProvider;
  LoginRepository({required this.remoteDataProvider});
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async {
  Response<dynamic> responseResult = await remoteDataProvider.loginAsync(request);
  return ValueCommitResult<LoginResponse>.fromJson(responseResult.data,(data)=> LoginResponse.fromJson(data as Map<String,dynamic>));
  }
}
