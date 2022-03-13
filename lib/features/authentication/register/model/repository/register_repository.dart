import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_provider/remote_data_provider/register_remote_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';

class RegisterRepository {
  final RegisterRemoteDataProvider remoteDataProvider;
  RegisterRepository({required this.remoteDataProvider});
  Future<ValueCommitResult<RegisterResponse>> registerAsync(RegisterRequest request) async {
  Response<dynamic> responseResult = await remoteDataProvider.registerAsync(request);
  return ValueCommitResult<RegisterResponse>.fromJson(responseResult.data,(data)=> RegisterResponse.fromJson(data as Map<String,dynamic>));
  }
}
