part of 'lesson_score_cubit.dart';

@immutable
abstract class LessonScoreState {}

class LessonScoreInitial extends LessonScoreState {}

class LessonScoreLoading extends LessonScoreState {}
class LessonScoreSuccess extends LessonScoreState {
  final int lessonScore;
  final int studentScore;
  LessonScoreSuccess({required this.lessonScore, required this.studentScore});
}
class LessonScoreFailed extends LessonScoreState {
  final String errorMessage;
  LessonScoreFailed({required this.errorMessage});
}
