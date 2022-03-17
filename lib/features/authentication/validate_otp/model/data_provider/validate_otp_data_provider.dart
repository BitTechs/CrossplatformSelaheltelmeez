import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/dio_client/dio_client.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_transfer_object/validate_otp_request.dart';

class ValidateOTPDataProvider{
  Future<Response<dynamic>> validateAsync(ValidateOTPRequest request, bool isMobile, String accessToken) async {
    Dio dioClient = await DioClient.getHttpClient(accessToken);
    return isMobile ? await dioClient.post("/Identity/VerifyMobile", data: request) : await dioClient.post("/Identity/VerifyEmail", data: request);
  }

  Future<Response<dynamic>> resendActivationCodeAsync(bool isMobile, String accessToken) async {
    Dio dioClient = await DioClient.getHttpClient(accessToken);
    return isMobile ? await dioClient.post("/Identity/ResendMobileOTP") : await dioClient.post("/Identity/ResendEmailOTP");
  }
}