class RemoteValidationErrorResponse {

  String? errorMessage;

  String? propertyName;

  RemoteValidationErrorResponse();

  @override
  String toString() {
    return 'RemoteValidationErrorResponse[errorMessage=$errorMessage, propertyName=$propertyName, ]';
  }

  RemoteValidationErrorResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    errorMessage = json['errorMessage'];
    propertyName = json['propertyName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'propertyName': propertyName
    };
  }

  static List<RemoteValidationErrorResponse> listFromJson(List<dynamic>? json) {
    return json == null ? List<RemoteValidationErrorResponse>.empty() : json.map((value) => RemoteValidationErrorResponse.fromJson(value)).toList();
  }

  static Map<String, RemoteValidationErrorResponse> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, RemoteValidationErrorResponse>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = RemoteValidationErrorResponse.fromJson(value));
    }
    return map;
  }
}
