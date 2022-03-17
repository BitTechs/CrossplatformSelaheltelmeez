import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_transfer_object/validate_otp_request.dart';

abstract class IValidateOTPDataProvider {
  Future<CommitResult> validateAsync(ValidateOTPRequest request,bool isMobile);
  Future<CommitResult> resendActivationCodeAsync(bool isMobile);
}