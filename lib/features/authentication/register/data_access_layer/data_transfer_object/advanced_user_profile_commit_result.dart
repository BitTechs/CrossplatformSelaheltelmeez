import 'package:selaheltelmeez/features/authentication/login/data_access_layer/data_transfer_object/advanced_user_profile.dart';

class AdvancedUserProfileCommitResult {
  
  String? errorMessage;

  int? errorCode;

  bool? isSuccess;

  bool? isExceptionOccurred;

  AdvancedUserProfile? value ;

  AdvancedUserProfileCommitResult();

  @override
  String toString() {
    return 'AdvancedUserProfileCommitResult[errorMessage=$errorMessage, errorCode=$errorCode, isSuccess=$isSuccess, isExceptionOccurred=$isExceptionOccurred, value=$value, ]';
  }

  AdvancedUserProfileCommitResult.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
    isSuccess = json['isSuccess'];
    isExceptionOccurred = json['isExceptionOccurred'];
    value = AdvancedUserProfile.fromJson(json['value']);
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

  static List<AdvancedUserProfileCommitResult> listFromJson(List<dynamic>? json) {
    return json == null ? List<AdvancedUserProfileCommitResult>.empty() : json.map((value) => AdvancedUserProfileCommitResult.fromJson(value)).toList();
  }

  static Map<String, AdvancedUserProfileCommitResult> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, AdvancedUserProfileCommitResult>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = AdvancedUserProfileCommitResult.fromJson(value));
    }
    return map;
  }
}
