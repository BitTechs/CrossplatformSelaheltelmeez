import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_request.dart';
import 'package:selaheltelmeez/features/authentication/login/model/data_transfer_object/login_response.dart';
import 'package:selaheltelmeez/features/authentication/login/model/repository/login_repository.dart';

part 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repo;
  LoginCubit(this._repo) : super(LoginInitial());

  Future<void> loginAsync(LoginRequest loginRequest)async{
    emit(LoginSubmit());
    ValueCommitResult<LoginResponse> response = await _repo.loginAsync(loginRequest);
    if(response.isSuccess){
      emit(LoginSuccess());
    }else{
      emit(LoginFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
