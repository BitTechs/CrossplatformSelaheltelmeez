import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';

part 'subject_score_state.dart';

class SubjectScoreCubit extends Cubit<SubjectScoreState> {
  final CurriculumRepository _repo;
  SubjectScoreCubit(this._repo) : super(SubjectScoreInitial());

  Future<void> loadStudentSubjectScore(String subjectId)async{
    emit(SubjectScoreLoading());
    final response = await _repo.getSubjectScoreAsync(subjectId);
    if(response.isSuccess){
      emit(SubjectScoreSuccess(subjectScore: response.value!.subjectScore, studentScore: response.value!.studentScore));
    }else{
      emit(SubjectScoreFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
