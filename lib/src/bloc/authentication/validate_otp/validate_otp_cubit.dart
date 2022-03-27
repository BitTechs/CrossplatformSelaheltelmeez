import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/validate_otp/validate_otp_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/validate_otp/validate_otp_repository.dart';

part 'validate_otp_state.dart';

class ValidateOtpCubit extends Cubit<ValidateOtpState> {
  final ValidateOTPRepository repo;
  final AppUserRepository appUserRepository;
  ValidateOtpCubit({required this.repo, required this.appUserRepository}) : super(ValidateOtpInitial());

  Future<void> validateAsync(String code) async{
    emit(ValidateOtpSubmit());
    final appUser = appUserRepository.getAppUser();
    bool isMobile = appUser?.email == null ? true : false;
    CommitResult commitResult =  await repo.validateAsync(ValidateOTPRequest(code: code), isMobile);
    if(commitResult.isSuccess){
      if(isMobile){
        appUser?.isMobileVerified = true;
      }else{
        appUser?.isEmailVerified = true;
      }
      appUserRepository.update(appUser!);
      emit(ValidateOtpSuccess());
    }else{
      emit(ValidateOtpFailed(errorMessage: commitResult.errorMessage ?? "An error occurred while processing your request."));
    }
  }

  Future<void> resendActivationCodeAsync()async {
    emit(ValidateOtpSubmit());
    final appUser = appUserRepository.getAppUser();
    bool isMobile = appUser?.email == null ? true : false;
    CommitResult commitResult =  await repo.resendActivationCodeAsync(isMobile);
    if(commitResult.isSuccess){
      emit(ResendValidateOtpSuccess());
    }else{
      emit(ValidateOtpFailed(errorMessage: commitResult.errorMessage?? "An error occurred while processing your request."));
    }
  }
}
