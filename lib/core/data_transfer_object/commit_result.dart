class CommitResult {
  
  String? errorMessage;

  int? errorCode;

  bool? isSuccess;

  bool? isExceptionOccurred;

  CommitResult();

  @override
  String toString() {
    return 'CommitResult[errorMessage=$errorMessage, errorCode=$errorCode, isSuccess=$isSuccess, isExceptionOccurred=$isExceptionOccurred, ]';
  }

  CommitResult.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorMessage = json['errorMessage'];
    errorCode = json['errorCode'];
    isSuccess = json['isSuccess'];
    isExceptionOccurred = json['isExceptionOccurred'];
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'isSuccess': isSuccess,
      'isExceptionOccurred': isExceptionOccurred,
     };
  }

  static List<CommitResult> listFromJson(List<dynamic>? json) {
    return json == null ? List<CommitResult>.empty() : json.map((value) => CommitResult.fromJson(value)).toList();
  }

  static Map<String, CommitResult> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, CommitResult>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = CommitResult.fromJson(value));
    }
    return map;
  }
}
