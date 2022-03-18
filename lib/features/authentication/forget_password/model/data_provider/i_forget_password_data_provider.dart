import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/confirm_otp_code_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/forget_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/reset_password_request.dart';

abstract class IForgetPasswordDataProvider{
  Future<CommitResult> sendForgetPasswordAsync(ForgetPasswordRequest request);

  Future<ValueCommitResult<String>> validateForgetPasswordOTPAsync(ConfirmOTPCodeRequest code);

  Future<CommitResult> sendResetPasswordRequest(ResetPasswordRequest request);

}