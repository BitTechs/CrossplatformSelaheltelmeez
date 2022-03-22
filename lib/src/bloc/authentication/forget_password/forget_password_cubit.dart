import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/forget_password/forget_password_request.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/forget_password/forget_password_repository.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepository _repo;
  ForgetPasswordCubit(this._repo) : super(ForgetPasswordInitial());

  Future<void> sendForgetPasswordAsync(ForgetPasswordRequest request) async {
    emit(ForgetPasswordSubmit());
    CommitResult response = await _repo.sendForgetPasswordAsync(request);
    if (response.isSuccess) {
      emit(ForgetPasswordSuccess());
    } else {
      emit(ForgetPasswordFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
