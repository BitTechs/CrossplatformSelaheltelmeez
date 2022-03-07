import 'dart:convert';
/// email : "string"
/// mobileNumber : "string"
/// passwordHash : "string"
/// googleId : "string"
/// officeId : "string"
/// facebookId : "string"

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));
String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());
class LoginRequest {
  LoginRequest({
      String? email = "",
      String? mobileNumber = "",
      String? passwordHash, 
      String? googleId = "",
      String? officeId = "",
      String? facebookId = "",}){
    _email = email;
    _mobileNumber = mobileNumber;
    _passwordHash = passwordHash;
    _googleId = googleId;
    _officeId = officeId;
    _facebookId = facebookId;
}

  LoginRequest.fromJson(dynamic json) {
    _email = json['email'];
    _mobileNumber = json['mobileNumber'];
    _passwordHash = json['passwordHash'];
    _googleId = json['googleId'];
    _officeId = json['officeId'];
    _facebookId = json['facebookId'];
  }
  String? _email;
  String? _mobileNumber;
  String? _passwordHash;
  String? _googleId;
  String? _officeId;
  String? _facebookId;

  String? get email => _email;
  String? get mobileNumber => _mobileNumber;
  String? get passwordHash => _passwordHash;
  String? get googleId => _googleId;
  String? get officeId => _officeId;
  String? get facebookId => _facebookId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['mobileNumber'] = _mobileNumber;
    map['passwordHash'] = _passwordHash;
    map['googleId'] = _googleId;
    map['officeId'] = _officeId;
    map['facebookId'] = _facebookId;
    return map;
  }

}