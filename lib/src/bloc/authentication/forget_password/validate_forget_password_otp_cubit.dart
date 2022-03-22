import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/confirm_otp_code_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/forget_password/forget_password_repository.dart';

part 'validate_forget_password_otp_state.dart';

class ValidateForgetPasswordOtpCubit extends Cubit<ValidateForgetPasswordOtpState> {
  final ForgetPasswordRepository _repo;
  ValidateForgetPasswordOtpCubit(this._repo) : super(ValidateForgetPasswordOtpInitial());
  Future<void> validateAsync(String code) async{
    emit(ValidateForgetPasswordOtpSubmit());
    ValueCommitResult<String> commitResult =  await _repo.validateForgetPasswordOTPAsync(ConfirmOTPCodeRequest(code));
    if(commitResult.isSuccess){
      emit(ValidateForgetPasswordOtpSuccess(identityUserId: commitResult.value!));
    }else{
      emit(ValidateForgetPasswordOtpFailed(errorMessage: commitResult.errorMessage ?? "An error occurred while processing your request."));
    }
  }

}
