import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';

abstract class ICurriculumDataProvider{

  Future<ValueCommitResult<List<StudentCurriculum>>> getStudentCurriculumsAsync();
}