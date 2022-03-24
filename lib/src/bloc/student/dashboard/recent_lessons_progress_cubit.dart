import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/dtos/recent_progress/student_recent_lesson_progress_response.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';

part 'recent_lessons_progress_state.dart';

class RecentLessonsCubit extends Cubit<RecentLessonsState> {
  final CurriculumRepository _repo;
  RecentLessonsCubit(this._repo) : super(RecentLessonsInitial());

  Future<void> getRecentLessonsAsync()async{
    emit(RecentLessonSubmit());
    final result = await _repo.getRecentProgressAsync();
    if(result.isSuccess){
      if(result.value?.isNotEmpty ?? false){
        emit(RecentLessonLoaded(recentLessonsProgress: result.value!));
      }else{
        emit(RecentLessonEmpty());
      }
    }else{
      emit(RecentLessonFailed(errorMessage : result.errorMessage ?? "Error"));
    }
  }

}
