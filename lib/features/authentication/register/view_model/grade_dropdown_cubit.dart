import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'grade_dropdown_state.dart';

class GradeDropdownCubit extends Cubit<GradeDropdownState> {
  GradeDropdownCubit() : super(GradeDropdownInitial());
  static GradeDropdownCubit get(context) => BlocProvider.of(context);

  late int? _gradeId;
  int? get getGradeId => _gradeId;
  void selectIdentityRole(int roleId){
    if(roleId == 1){
      emit(GradeDropdownStudentSelectedState());
    }else if(roleId == 2){
      emit(GradeDropdownParentSelectedState());
    }else{
      emit(GradeDropdownTeacherSelectedState());
    }
  }
}
