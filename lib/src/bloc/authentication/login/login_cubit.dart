import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_response.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/login/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repo;

  LoginCubit(this._repo) : super(LoginInitial());

  Future<void> loginAsync(LoginRequest loginRequest) async {
    emit(LoginSubmit());
    ValueCommitResult<LoginResponse> response = await _repo.loginAsync(loginRequest);
    if (response.isSuccess) {
      await AppUserLocalStorageProvider.addLoginResponseAsync(response.value!);
      if (response.value!.isVerified) {
        emit(LoginVerifiedSuccess());
      } else {
        emit(LoginNotVerifiedSuccess());
      }
    } else {
      emit(LoginFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
