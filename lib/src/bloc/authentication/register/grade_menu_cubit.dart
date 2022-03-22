import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/authentication/dtos/register/grade_menu_item.dart';
import 'package:selaheltelmeez/src/data/authentication/repositories/register/register_repository.dart';

part 'grade_menu_state.dart';

class GradeMenuCubit extends Cubit<GradeMenuState> {
  final RegisterRepository _repo;
  final List<GradeMenuItem> menuItems = [];

  GradeMenuCubit(this._repo) : super(GradeMenuInitial());

  int? _gradeId;
  bool? _isStudentSelected;

  int? get getGradeId => _gradeId;

  void selectGradeMenuItem(int id) {
    if (_isStudentSelected ?? false) {
      _gradeId = id;
    } else {
      _gradeId = null;
    }
  }

  Future<void> confirmSelectionToStudentRole(bool isStudent) async {
    _isStudentSelected = isStudent;
    if (_isStudentSelected ?? false) {
      await getGradeMenuItemsAsync();
    } else {
      _gradeId = null;
      emit(GradeMenuHide());
    }
  }

  Future<void> getGradeMenuItemsAsync() async {
    emit(GradeMenuLoading());
    if (menuItems.isEmpty) {
      ValueCommitResult<List<GradeMenuItem>> response =
          await _repo.getGradeMenuItemsAsync();
      if (response.isSuccess) {
        menuItems.addAll(response.value!);
      } else {
        emit(GradeMenuError(errorMessage: response.errorMessage ?? "Error"));
      }
    }
    emit(GradeMenuLoaded(items: menuItems));
  }
}
