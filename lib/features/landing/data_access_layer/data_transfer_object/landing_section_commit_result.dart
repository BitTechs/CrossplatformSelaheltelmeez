import 'package:selaheltelmeez/features/landing/data_access_layer/data_transfer_object/landing_section.dart';

class LandingSectionCommitResult {
  String? errorMessage;
  int? errorCode;
  bool? isSuccess;
  bool? isExceptionOccurred;
  LandingSection? value;
  LandingSectionCommitResult();

  @override
  String toString() {
    return 'LandingSectionCommitResult[errorMessage=$errorMessage, errorCode=$errorCode, isSuccess=$isSuccess, isExceptionOccurred=$isExceptionOccurred, value=$value, ]';
  }

  LandingSectionCommitResult.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
    isSuccess = json['isSuccess'];
    isExceptionOccurred = json['isExceptionOccurred'];
    value = LandingSection.fromJson(json['value']);
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'isSuccess': isSuccess,
      'isExceptionOccurred': isExceptionOccurred,
      'value': value
     };
  }

  static List<LandingSectionCommitResult> listFromJson(List<dynamic>? json) {
    return json == null ? List<LandingSectionCommitResult>.empty() : json.map((value) => LandingSectionCommitResult.fromJson(value)).toList();
  }

  static Map<String, LandingSectionCommitResult> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, LandingSectionCommitResult>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = LandingSectionCommitResult.fromJson(value));
    }
    return map;
  }
}
