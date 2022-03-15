import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/features/authentication/register/model/data_transfer_object/grade_menu_item.dart';
import 'package:selaheltelmeez/features/authentication/register/model/repository/register_repository.dart';

part 'grade_menu_state.dart';

class GradeMenuCubit extends Cubit<GradeMenuState> {
  final RegisterRepository _repo;
  GradeMenuCubit(this._repo) : super(GradeMenuInitial());

  Future<void> getGradeMenuItemsAsync()async{
    emit(GradeMenuLoading());
    ValueCommitResult<List<GradeMenuItem>> response = await _repo.getGradeMenuItemsAsync();
    if(response.isSuccess){
      emit(GradeMenuLoaded(items: response.value));
    }else{
      emit(GradeMenuError(errorMessage: response.errorMessage ?? "Error"));
    }
  }
}
