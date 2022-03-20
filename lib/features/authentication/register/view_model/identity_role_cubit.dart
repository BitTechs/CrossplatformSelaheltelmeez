import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'identity_role_state.dart';

class IdentityRoleCubit extends Cubit<IdentityRoleState> {
  IdentityRoleCubit() : super(IdentityRoleInitial());
  static IdentityRoleCubit get(context) => BlocProvider.of(context);

  late int _identityRoleId = 1;
  int get getIdentityRoleId => _identityRoleId;
  void selectIdentityRole(int roleId){
    _identityRoleId = roleId;
    if(_identityRoleId == 1){
      emit(IdentityRoleStudentState());
    }else if(_identityRoleId == 2){
      emit(IdentityRoleParentState());
    }else{
      emit(IdentityRoleTeacherState());
    }
  }


}
