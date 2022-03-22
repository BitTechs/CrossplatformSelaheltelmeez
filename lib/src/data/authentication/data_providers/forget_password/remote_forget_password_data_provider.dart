import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/confirm_otp_code_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/forget_password_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/reset_password_request.dart';

class  RemoteForgetPasswordDataProvider {
  final IDioClient dioClient;
  RemoteForgetPasswordDataProvider({required this.dioClient});

  Future<CommitResult> sendForgetPasswordAsync(ForgetPasswordRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/ForgetPassword", data: request);
    return CommitResult.fromJson(response.data);
  }

  Future<ValueCommitResult<String>> validateForgetPasswordOTPAsync(ConfirmOTPCodeRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/ConfirmForgetPassword", data: request);
    return ValueCommitResult<String>.fromJson(response.data,(data)=> data as String);
  }

  Future<CommitResult> sendResetPasswordRequest(ResetPasswordRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/resetPassword", data: request);
    return CommitResult.fromJson(response.data);
  }

}