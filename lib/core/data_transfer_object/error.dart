class Error {
  
  int? errorCode;

  String? errorMessage;

  String? description;

  String? comment;

  Error();

  @override
  String toString() {
    return 'Error[errorCode=$errorCode, errorMessage=$errorMessage, description=$description, comment=$comment, ]';
  }

  Error.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    description = json['description'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'errorCode': errorCode,
      'errorMessage': errorMessage,
      'description': description,
      'comment': comment
     };
  }

  static List<Error> listFromJson(List<dynamic>? json) {
    return json == null ? List<Error>.empty() : json.map((value) => Error.fromJson(value)).toList();
  }

  static Map<String, Error> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, Error>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = Error.fromJson(value));
    }
    return map;
  }
}
