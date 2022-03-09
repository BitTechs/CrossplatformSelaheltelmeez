import 'package:selaheltelmeez/features/student/home/data_access_layer/data_transfer_object/subject/subject.dart';

class SubjectIEnumerableCommitResult {
  
  String? errorMessage;

  int? errorCode;

  bool? isSuccess;

  List<Subject> value = [];

  SubjectIEnumerableCommitResult();

  @override
  String toString() {
    return 'SubjectIEnumerableCommitResult[errorMessage=$errorMessage, errorCode=$errorCode, isSuccess=$isSuccess, value=$value, ]';
  }

  SubjectIEnumerableCommitResult.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
    isSuccess = json['isSuccess'];
    value = Subject.listFromJson(json['value']);
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'isSuccess': isSuccess,
      'value': value
     };
  }

  static List<SubjectIEnumerableCommitResult> listFromJson(List<dynamic>? json) {
    return json == null ? List<SubjectIEnumerableCommitResult>.empty() : json.map((value) => SubjectIEnumerableCommitResult.fromJson(value)).toList();
  }

  static Map<String, SubjectIEnumerableCommitResult> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, SubjectIEnumerableCommitResult>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = SubjectIEnumerableCommitResult.fromJson(value));
    }
    return map;
  }
}
