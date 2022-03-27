import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/local_storage/repositories/app_user_repository.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_request.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/register_response.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/register/register_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository repo;
  final AppUserRepository appUserRepository;

  RegisterCubit({required this.repo, required this.appUserRepository}) : super(RegisterInitial());

  Future<void> registerAsync(RegisterRequest registerRequest)async{
    emit(RegisterSubmit());
    ValueCommitResult<RegisterResponse> response = await repo.registerAsync(registerRequest);
    if(response.isSuccess){
       appUserRepository.saveRegisterResponse(response.value!);
      emit(RegisterSuccess());
    }else{
      emit(RegisterFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }

  void showInputForm()
  {
    emit(ShowInputForm());
  }

}
