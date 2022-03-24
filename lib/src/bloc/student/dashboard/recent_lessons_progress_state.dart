part of 'recent_lessons_progress_cubit.dart';

@immutable
abstract class RecentLessonsState {}

class RecentLessonsInitial extends RecentLessonsState {}
class RecentLessonSubmit extends RecentLessonsState{}
class RecentLessonLoaded extends RecentLessonsState{
  final List<StudentRecentLessonProgressResponse> recentLessonsProgress;
  RecentLessonLoaded({required this.recentLessonsProgress});
}
class RecentLessonEmpty extends RecentLessonsState{}
class RecentLessonFailed extends RecentLessonsState{
  final String errorMessage;
  RecentLessonFailed({required this.errorMessage});
}