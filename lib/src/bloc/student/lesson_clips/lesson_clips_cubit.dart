import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/clip_type.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/game_object_clip.dart';
import 'package:selaheltelmeez/src/data/student/dtos/lesson_clips/lesson_clip_response.dart';
import 'package:selaheltelmeez/src/data/student/repositories/curriculum/curriculum_repository.dart';

part 'lesson_clips_state.dart';

class LessonClipsCubit extends Cubit<LessonClipsState> {
  final CurriculumRepository _repo;
  LessonClipResponse? _lessonClipResponse;
  List<GameObjectClip>? _clips;
  int? selectedClipType;
  LessonClipsCubit(this._repo) : super(LessonClipsInitial());

  Future<void> getLessonClipsAsync(int id)async{
    emit(LessonClipsLoading());
    final response = await _repo.getLessonClipsAsync(id);
    if(response.isSuccess){
      _lessonClipResponse = response.value;
      emit(LessonClipsSuccess(_lessonClipResponse!.types, _lessonClipResponse!.clips));
    }else{
      emit(LessonClipsFailed(response.errorMessage ?? "Error"));
    }
  }

  void applyFilter(int filterId){
      selectedClipType = filterId;
      final filteredClips = _lessonClipResponse!.clips.where((element) => element.clipType == filterId);
      emit(LessonClipsSuccess(_lessonClipResponse!.types, filteredClips.toList()));

  }
}
