part of 'grade_menu_cubit.dart';

@immutable
abstract class GradeMenuState {}

class GradeMenuInitial extends GradeMenuState {}
class GradeMenuLoading extends GradeMenuState {}
class GradeMenuLoaded extends GradeMenuState {
  final List<GradeMenuItem>? items;
  GradeMenuLoaded({required this.items});
}
class GradeMenuError extends GradeMenuState {
  final String? errorMessage;
  GradeMenuError({required this.errorMessage});
}

