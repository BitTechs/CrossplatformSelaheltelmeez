import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/reset_password_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/forget_password/forget_password_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ForgetPasswordRepository _repo;
  ResetPasswordCubit(this._repo) : super(ResetPasswordInitial());

  Future<void> resetAsync(ResetPasswordRequest request) async{
    emit(ResetPasswordSubmit());
    CommitResult commitResult =  await _repo.sendResetPasswordRequest(request);
    if(commitResult.isSuccess){
      emit(ResetPasswordSuccess());
    }else{
      emit(ResetPasswordFailed(errorMessage: commitResult.errorMessage ?? "An error occurred while processing your request."));
    }
  }
}
