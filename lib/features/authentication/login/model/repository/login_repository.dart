import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_provider/login_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_response.dart';

class LoginRepository {
  final LoginDataProvider dataProvider;
  LoginRepository({required this.dataProvider});
  Future<ValueCommitResult<LoginResponse>> loginAsync(LoginRequest request) async {
  Response<dynamic> responseResult = await dataProvider.loginAsync(request);
  return ValueCommitResult<LoginResponse>.fromJson(responseResult.data,(data)=> LoginResponse.fromJson(data as Map<String,dynamic>));
  }
}
