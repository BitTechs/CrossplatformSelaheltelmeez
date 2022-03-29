import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/game_object_clip.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/lesson_clip_response.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';

part 'lesson_clips_state.dart';

class LessonClipsCubit extends Cubit<LessonClipsState> {
  final CurriculumRepository _repo;
  LessonClipResponse? _lessonClipResponse;
  List<GameObjectClip>? _clips;
  LessonClipsCubit(this._repo) : super(LessonClipsInitial());

  Future<void> getLessonClipsAsync(int id)async{
    emit(LessonClipsLoading());
    final response = await _repo.getLessonClipsAsync(id);
    if(response.isSuccess){
      _lessonClipResponse = response.value;
      _clips = response.value?.clips;
      emit(LessonClipsSuccess(_lessonClipResponse!));
    }else{
      emit(LessonClipsFailed(response.errorMessage ?? "Error"));
    }
  }

  void applyFilter(int filterId){
    if(_clips != null && _clips!.isNotEmpty){
      final filteredClips = _clips!.where((element) => element.clipType == filterId);
      _lessonClipResponse!.clips.removeRange(0, _clips!.length - 1);
      _lessonClipResponse!.clips.addAll(filteredClips);
      emit(LessonClipsSuccess(_lessonClipResponse!));
    }
  }
}
