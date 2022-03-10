import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/subject/subject.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/repository/student_home_repository.dart';

part 'subject_status_state.dart';

class SubjectStatusCubit extends Cubit<SubjectStatusState> {
  final repo = StudentHomeRepository();
  final List<Subject> subjects = [];
  SubjectStatusCubit() : super(SubjectStatusInitial());

  Future<void> getSubjectsAsync(String termName)async {
    emit(SubjectStatusLoading());
    final result = await repo.getSubjectsAsync();
    if(result.isSuccess ?? false){
      subjects.addAll(result.value.where((element) => element.termName == termName));
      if(subjects.isNotEmpty){
        emit(SubjectStatusLoaded(subjects: subjects));
      }else{
        emit(SubjectStatusEmpty());
      }
    }else{
      emit(SubjectStatusError(errorMessage: result.errorMessage ?? "An error occurred while processing, please try again later"));
    }
  }
}
