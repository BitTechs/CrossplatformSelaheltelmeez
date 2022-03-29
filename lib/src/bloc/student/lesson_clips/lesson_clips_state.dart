part of 'lesson_clips_cubit.dart';

@immutable
abstract class LessonClipsState {}

class LessonClipsInitial extends LessonClipsState {}
class LessonClipsLoading extends LessonClipsState {}
class LessonClipsSuccess extends LessonClipsState {
  final LessonClipResponse lessonsClip;
  LessonClipsSuccess(this.lessonsClip);
}
class LessonClipsFailed extends LessonClipsState {
  final String errorMessage;
  LessonClipsFailed(this.errorMessage);
}
