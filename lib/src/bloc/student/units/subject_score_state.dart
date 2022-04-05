part of 'subject_score_cubit.dart';

@immutable
abstract class SubjectScoreState {}

class SubjectScoreInitial extends SubjectScoreState {}
class SubjectScoreLoading extends SubjectScoreState {}
class SubjectScoreSuccess extends SubjectScoreState {
  final int subjectScore;
  final int studentScore;
  SubjectScoreSuccess({required this.subjectScore, required this.studentScore});
}
class SubjectScoreFailed extends SubjectScoreState {
  final String errorMessage;
  SubjectScoreFailed({required this.errorMessage});
}
