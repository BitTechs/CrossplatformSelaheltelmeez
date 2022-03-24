import 'package:selaheltelmeez/core/data_transfer_object/value_commit_result.dart';
import 'package:selaheltelmeez/src/data/student/data_provider/curriculum/curriculum_data_provider.dart';
import 'package:selaheltelmeez/src/data/student/dtos/curriculum/student_curriculum.dart';
import 'package:selaheltelmeez/src/data/student/dtos/recent_progress/student_recent_lesson_progress_response.dart';

class CurriculumRepository {
  final CurriculumDataProvider dataProvider;
  CurriculumRepository({required this.dataProvider});

  Future<ValueCommitResult<List<StudentCurriculum>>> getCurriculumsAsync() async => await dataProvider.getStudentCurriculumsAsync();
  Future<ValueCommitResult<List<StudentRecentLessonProgressResponse>>> getRecentProgressAsync() async => await dataProvider.getRecentLessonsProgressAsync();
}
