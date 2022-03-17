import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/data_transfer_object/validate_otp_request.dart';
import 'package:selaheltelmeez/features/authentication/validate_otp/model/repository/validate_otp_repository.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  final ValidateOTPRepository _repo;
  ValidateOtpCubit(this._repo) : super(ValidateOtpInitial());

  Future<void> validateAsync(String code, bool isMobile, String accessToken )async{
    emit(ValidateOtpSubmit());
    CommitResult commitResult =  await _repo.validateAsync(ValidateOTPRequest(code: code), isMobile,accessToken);
    if(commitResult.isSuccess){
      emit(ValidateOtpSuccess());
    }else{
      emit(ValidateOtpFailed(errorMessage: commitResult.errorMessage ?? "An error occurred while processing your request."));
    }
  }

  Future<void> resendActivationCodeAsync(bool isMobile, String accessToken)async{
    emit(ValidateOtpSubmit());
    CommitResult commitResult =  await _repo.resendActivationCodeAsync(isMobile,accessToken);
    if(commitResult.isSuccess){
      emit(ResendValidateOtpSuccess());
    }else{
      emit(ValidateOtpFailed(errorMessage: commitResult.errorMessage?? "An error occurred while processing your request."));
    }
  }
}
