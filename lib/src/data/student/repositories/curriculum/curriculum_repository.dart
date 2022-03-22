import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/curriculum/i_curriculum_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';

class CurriculumRepository {
  final ICurriculumDataProvider dataProvider;
  CurriculumRepository({required this.dataProvider});

  Future<ValueCommitResult<List<StudentCurriculum>>> getCurriculumsAsync() async => await dataProvider.getStudentCurriculumsAsync();
}
