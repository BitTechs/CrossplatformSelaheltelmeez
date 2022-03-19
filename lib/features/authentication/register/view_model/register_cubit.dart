import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/core/local_storage/app_user_local_storage_provider.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_request.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/register_response.dart';
import 'package:selaheltelmeez/features/authentication/register/model/repository/register_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository _repo;

  int selectedRole = 1;
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterCubit(this._repo) : super(RegisterInitial());
  late int _identityRoleId = 1;
  void setIdentityRoleId(int roleId)=> _identityRoleId = roleId;
  int get getIdentityRoleId => _identityRoleId;

  late int _gradeId = 1;
  void setGradeId(int gradeId)=> _gradeId = gradeId;
  int get getGradeId => _gradeId;

  Future<void> registerAsync(RegisterRequest registerRequest)async{
    emit(RegisterSubmit());
    ValueCommitResult<RegisterResponse> response = await _repo.registerAsync(registerRequest);
    if(response.isSuccess){
      await AppUserLocalStorageProvider.addAsJsonAsync(response.value!.toJson());
      emit(RegisterSuccess());
    }else{
      emit(RegisterFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }

  void changeRoleColor(int role)
  {
    selectedRole = role;
    emit(ChangeRoleColor());
  }
}
