import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/recent_lesson/recent.dart';
import 'package:selaheltelmeez/core/data_transfer_object/error.dart';
class RecentLesson {
  
  List<Recent> recentLessons = [];

  Error? error;

  RecentLesson();

  @override
  String toString() {
    return 'RecentLesson[recentLessons=$recentLessons, error=$error, ]';
  }

  RecentLesson.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    recentLessons = Recent.listFromJson(json['recentLessons']);
    error = Error.fromJson(json['error']);
  }

  Map<String, dynamic> toJson() {
    return {
      'recentLessons': recentLessons,
      'error': error
     };
  }

  static List<RecentLesson> listFromJson(List<dynamic>? json) {
    return json == null ? List<RecentLesson>.empty() : json.map((value) => RecentLesson.fromJson(value)).toList();
  }

  static Map<String, RecentLesson> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, RecentLesson>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = RecentLesson.fromJson(value));
    }
    return map;
  }
}
