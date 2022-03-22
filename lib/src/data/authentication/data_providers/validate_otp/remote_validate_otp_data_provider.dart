import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/validate_otp/validate_otp_request.dart';

class RemoteValidateOTPDataProvider  {
  final IDioClient dioClient;
  RemoteValidateOTPDataProvider({required this.dioClient});

  Future<CommitResult> resendActivationCodeAsync(bool isMobile) async {
    Response<dynamic> response = isMobile ? await dioClient.getClient().post("/Identity/ResendMobileOTP") : await dioClient.getClient().post("/Identity/ResendEmailOTP");
    return CommitResult.fromJson(response.data);
  }

  Future<CommitResult> validateAsync(ValidateOTPRequest request, bool isMobile) async {
    Response<dynamic> response = isMobile ? await dioClient.getClient().post("/Identity/VerifyMobile", data: request) : await dioClient.getClient().post("/Identity/VerifyEmail", data: request);
    return CommitResult.fromJson(response.data);
  }
}