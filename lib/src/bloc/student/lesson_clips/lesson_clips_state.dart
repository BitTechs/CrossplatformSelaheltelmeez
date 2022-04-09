part of 'lesson_clips_cubit.dart';

@immutable
abstract class LessonClipsState {}

class LessonClipsInitial extends LessonClipsState {}
class LessonClipsLoading extends LessonClipsState {}
class LessonClipsSuccess extends LessonClipsState {
  final List<ClipType> types;
  final List<GameObjectClip> clips;
  LessonClipsSuccess(this.types, this.clips);
}
class LessonClipsFailed extends LessonClipsState {
  final String errorMessage;
  LessonClipsFailed(this.errorMessage);
}
