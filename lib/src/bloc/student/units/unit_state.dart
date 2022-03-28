part of 'unit_cubit.dart';

@immutable
abstract class UnitState {}

class UnitInitial extends UnitState {}
class UnitLoading extends UnitState {}
class UnitSuccess extends UnitState {
  final List<CurriculumUnit> units;
  UnitSuccess(this.units);
}
class UnitFailed extends UnitState {
  final String errorMessage;
  UnitFailed(this.errorMessage);
}
