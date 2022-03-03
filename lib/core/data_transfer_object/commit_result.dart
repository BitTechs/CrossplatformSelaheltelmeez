import 'dart:convert';
/// errorMessage : ""
/// errorCode : 0
/// isSuccess : true
/// isExceptionOccurred : false
/// source : 0

CommitResult commitResultFromJson(String str) => CommitResult.fromJson(json.decode(str));
String commitResultToJson(CommitResult data) => json.encode(data.toJson());
class CommitResult {
  CommitResult({
      String? errorMessage, 
      int? errorCode, 
      bool? isSuccess, 
      bool? isExceptionOccurred, 
      int? source,}){
    _errorMessage = errorMessage;
    _errorCode = errorCode;
    _isSuccess = isSuccess;
    _isExceptionOccurred = isExceptionOccurred;
    _source = source;
}

  CommitResult.fromJson(dynamic json) {
    _errorMessage = json['errorMessage'];
    _errorCode = json['errorCode'];
    _isSuccess = json['isSuccess'];
    _isExceptionOccurred = json['isExceptionOccurred'];
    _source = json['source'];
  }
  String? _errorMessage;
  int? _errorCode;
  bool? _isSuccess;
  bool? _isExceptionOccurred;
  int? _source;

  String? get errorMessage => _errorMessage;
  int? get errorCode => _errorCode;
  bool? get isSuccess => _isSuccess;
  bool? get isExceptionOccurred => _isExceptionOccurred;
  int? get source => _source;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorMessage'] = _errorMessage;
    map['errorCode'] = _errorCode;
    map['isSuccess'] = _isSuccess;
    map['isExceptionOccurred'] = _isExceptionOccurred;
    map['source'] = _source;
    return map;
  }

}