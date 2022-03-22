import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/validate_otp/remote_validate_otp_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/validate_otp/validate_otp_request.dart';

class ValidateOTPRepository {
  final RemoteValidateOTPDataProvider dataProvider;
  ValidateOTPRepository({required this.dataProvider});
  Future<CommitResult> validateAsync(ValidateOTPRequest request, bool isMobile) async=> await dataProvider.validateAsync(request, isMobile);
  Future<CommitResult> resendActivationCodeAsync(bool isMobile) async => await dataProvider.resendActivationCodeAsync(isMobile);
}
