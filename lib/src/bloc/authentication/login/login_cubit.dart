import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/login/login_response.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/login/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;
  final AppUserRepository appUserRepository;

  LoginCubit({required this.repo, required this.appUserRepository}) : super(LoginInitial());

  Future<void> loginAsync(LoginRequest loginRequest) async {
    emit(LoginSubmit());
    ValueCommitResult<LoginResponse> response = await repo.loginAsync(loginRequest);
    if (response.isSuccess) {
      appUserRepository.saveLoginResponse(response.value!);
      if (response.value!.isEmailVerified || response.value!.isMobileVerified) {
        emit(LoginVerifiedSuccess());
      } else {
        emit(LoginNotVerifiedSuccess());
      }
    } else {
      emit(LoginFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
