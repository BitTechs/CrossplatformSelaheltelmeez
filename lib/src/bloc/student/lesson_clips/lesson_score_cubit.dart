import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';

part 'lesson_score_state.dart';

class LessonScoreCubit extends Cubit<LessonScoreState> {
  final CurriculumRepository _repo;
  LessonScoreCubit(this._repo) : super(LessonScoreInitial());

  Future<void> loadStudentLessonScore(int lessonId)async{
    emit(LessonScoreLoading());
    final response = await _repo.getLessonScoreAsync(lessonId);
    if(response.isSuccess){
      emit(LessonScoreSuccess(lessonScore: response.value!.lessonScore, studentScore: response.value!.studentScore));
    }else{
      emit(LessonScoreFailed(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
