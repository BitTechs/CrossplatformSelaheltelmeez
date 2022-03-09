import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/recent_lesson/recent_lesson.dart';

class RecentLessonCommitResult {
  
  String? errorMessage;

  int? errorCode;

  bool? isSuccess;

  RecentLesson? value;

  RecentLessonCommitResult();

  @override
  String toString() {
    return 'RecentLessonCommitResult[errorMessage=$errorMessage, errorCode=$errorCode, isSuccess=$isSuccess, value=$value, ]';
  }

  RecentLessonCommitResult.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
    isSuccess = json['isSuccess'];
    value = RecentLesson.fromJson(json['value']);
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'isSuccess': isSuccess,
      'value': value
     };
  }

  static List<RecentLessonCommitResult> listFromJson(List<dynamic>? json) {
    return json == null ? List<RecentLessonCommitResult>.empty() : json.map((value) => RecentLessonCommitResult.fromJson(value)).toList();
  }

  static Map<String, RecentLessonCommitResult> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, RecentLessonCommitResult>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = RecentLessonCommitResult.fromJson(value));
    }
    return map;
  }
}
