import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/data_providers/forget_password/remote_forget_password_data_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/confirm_otp_code_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/forget_password_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/reset_password_request.dart';

class ForgetPasswordRepository{
  final RemoteForgetPasswordDataProvider dataProvider;
  ForgetPasswordRepository({required this.dataProvider});
  Future<CommitResult> sendForgetPasswordAsync(ForgetPasswordRequest request) async => await dataProvider.sendForgetPasswordAsync(request);
  Future<ValueCommitResult<String>> validateForgetPasswordOTPAsync(ConfirmOTPCodeRequest code) async => await dataProvider.validateForgetPasswordOTPAsync(code);
  Future<CommitResult> sendResetPasswordRequest(ResetPasswordRequest request) async => await dataProvider.sendResetPasswordRequest(request);
}