import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/dtos/unit/curriculum_unit.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  final CurriculumRepository _repo;
  UnitCubit(this._repo) : super(UnitInitial());


  Future<void> loadUnitsByCurriculumId(String id)async{
    emit(UnitLoading());
    final response = await _repo.getCurriculumUnitsAsync(id);
    if(response.isSuccess){
      emit(UnitSuccess(response.value!));
    }else{
      emit(UnitFailed(response.errorMessage ?? "Error"));
    }
  }


}
