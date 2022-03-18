import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_provider/i_forget_password_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/confirm_otp_code_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/forget_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/reset_password_request.dart';

class  RemoteForgetPasswordDataProvider implements IForgetPasswordDataProvider{
  final IDioClient dioClient;
  RemoteForgetPasswordDataProvider({required this.dioClient});

  @override
  Future<CommitResult> sendForgetPasswordAsync(ForgetPasswordRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/ForgetPassword", data: request);
    print(response);
    return CommitResult.fromJson(response.data);
  }

  @override
  Future<ValueCommitResult<String>> validateForgetPasswordOTPAsync(ConfirmOTPCodeRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/ConfirmForgetPassword", data: request);
    return ValueCommitResult<String>.fromJson(response.data,(data)=> data as String);
  }

  @override
  Future<CommitResult> sendResetPasswordRequest(ResetPasswordRequest request) async {
    Response<dynamic> response = await dioClient.getClient().post("/Identity/resetPassword", data: request);
    return CommitResult.fromJson(response.data);
  }

}