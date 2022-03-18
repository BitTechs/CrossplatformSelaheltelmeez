import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_provider/i_forget_password_data_provider.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/confirm_otp_code_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/forget_password_request.dart';
import 'package:selaheltelmeez/features/authentication/forget_password/model/data_transfer_object/reset_password_request.dart';

class ForgetPasswordRepository{
  final IForgetPasswordDataProvider dataProvider;
  ForgetPasswordRepository({required this.dataProvider});
  Future<CommitResult> sendForgetPasswordAsync(ForgetPasswordRequest request) async => await dataProvider.sendForgetPasswordAsync(request);
  Future<ValueCommitResult<String>> validateForgetPasswordOTPAsync(ConfirmOTPCodeRequest code) async => await dataProvider.validateForgetPasswordOTPAsync(code);
  Future<CommitResult> sendResetPasswordRequest(ResetPasswordRequest request) async => await dataProvider.sendResetPasswordRequest(request);
}