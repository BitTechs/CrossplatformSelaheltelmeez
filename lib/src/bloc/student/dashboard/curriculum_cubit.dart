import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';




part 'curriculum_state.dart';

class CurriculumCubit extends Cubit<CurriculumState> {

  late List<StudentCurriculum> curriculumSubjects = [];

  final CurriculumRepository _repo;
  CurriculumCubit(this._repo) : super(CurriculumInitial());

  Future<void> getSubjectsAsync(int? termId) async {
    if(curriculumSubjects.isNotEmpty){
      emit(CurriculumLoaded(subjects: curriculumSubjects.where((element) => element.term == termId).toList()));
    }else{
      emit(CurriculumLoading());
      final result = await _repo.getCurriculumsAsync();
      if(result.isSuccess){
        if(result.value?.isNotEmpty ?? false){
          curriculumSubjects.addAll(result.value!);
          emit(CurriculumLoaded(subjects: curriculumSubjects.where((element) => element.term == termId).toList()));
        }else{
          emit(CurriculumEmpty());
        }
      }else{
        emit(CurriculumError(errorMessage: result.errorMessage ?? "An error occurred while processing, please try again later"));
      }
    }

  }


}
