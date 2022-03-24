part of 'curriculum_cubit.dart';

@immutable
abstract class CurriculumState {}

class CurriculumInitial extends CurriculumState {}
class CurriculumLoading extends CurriculumState {}
class CurriculumEmpty extends CurriculumState {}
class CurriculumLoaded extends CurriculumState {
  final List<StudentCurriculum> subjects;
  CurriculumLoaded({required this.subjects});
}
class CurriculumError extends CurriculumState{
  final String errorMessage;
  CurriculumError({required this.errorMessage});
}


