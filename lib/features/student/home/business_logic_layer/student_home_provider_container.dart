import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section_commit_result.dart';
import 'package:selaheltelmeez/features/landing/data_access_layer/repository/landing_repository.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/recent_lesson/recent_lesson_commit_result.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/subject/subject_i_enumerable_commit_result.dart';
import 'package:selaheltelmeez/features/student/home/data_access_layer/repository/student_home_repository.dart';

class StudentHomeProviderContainer {

  static final futureGetRecentLessonsProvider =
      FutureProvider<RecentLessonCommitResult>((ref) async => await StudentHomeRepository().getRecentLessonsAsync());

  static final futureGetSubjectProvider =
  FutureProvider<SubjectIEnumerableCommitResult>((ref) async => await StudentHomeRepository().getSubjectsAsync());
}
