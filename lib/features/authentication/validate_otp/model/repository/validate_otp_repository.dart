import 'package:dio/dio.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_provider/validate_otp_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_transfer_object/validate_otp_request.dart';

class ValidateOTPRepository {
  final ValidateOTPDataProvider dataProvider;
  ValidateOTPRepository({required this.dataProvider});
  Future<CommitResult> validateAsync(ValidateOTPRequest request, bool isMobile, String accessToken) async {
    Response<dynamic> responseResult =  await dataProvider.validateAsync(request, isMobile,accessToken);
    return CommitResult.fromJson(responseResult.data);
  }

  Future<CommitResult> resendActivationCodeAsync(bool isMobile, String accessToken) async {
    Response<dynamic> responseResult =  await dataProvider.resendActivationCodeAsync(isMobile,accessToken);
    return CommitResult.fromJson(responseResult.data);
  }
}
