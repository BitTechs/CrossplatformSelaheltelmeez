part of 'subject_status_cubit.dart';

@immutable
abstract class SubjectStatusState {}

class SubjectStatusInitial extends SubjectStatusState {}
class SubjectStatusLoading extends SubjectStatusState {}
class SubjectStatusEmpty extends SubjectStatusState {}
class SubjectStatusLoaded extends SubjectStatusState {
  final List<Subject> subjects;
  SubjectStatusLoaded({required this.subjects});
}
class SubjectStatusError extends SubjectStatusState{
  final String errorMessage;
  SubjectStatusError({required this.errorMessage});
}
