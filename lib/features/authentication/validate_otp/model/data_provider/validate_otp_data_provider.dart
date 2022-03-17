import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_provider/i_validate_otp_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_transfer_object/validate_otp_request.dart';

class ValidateOTPDataProvider implements IValidateOTPDataProvider {
  final IDioClient dioClient;
  ValidateOTPDataProvider({required this.dioClient});

  @override
  Future<CommitResult> resendActivationCodeAsync(bool isMobile) async {
    Response<dynamic> response = isMobile ? await dioClient.getClient().post("/Identity/ResendMobileOTP") : await dioClient.getClient().post("/Identity/ResendEmailOTP");
    return CommitResult.fromJson(response.data);
  }

  @override
  Future<CommitResult> validateAsync(ValidateOTPRequest request, bool isMobile) async {
    Response<dynamic> response = isMobile ? await dioClient.getClient().post("/Identity/VerifyMobile", data: request) : await dioClient.getClient().post("/Identity/VerifyEmail", data: request);
    return CommitResult.fromJson(response.data);
  }
}