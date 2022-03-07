import 'dart:convert';
/// userId : "string"
/// fullName : "string"
/// email : "string"
/// passwordHash : "string"
/// googleId : "string"
/// facebookId : "string"
/// officeId : "string"
/// studingYear : 0
/// gradeName : "string"
/// userRole : 0
/// mobileNumber : "string"
/// country : 0
/// governorate : 0
/// yob : 0
/// gender : 0
/// emailConfirmed : true
/// mobileNumberConfirmed : true
/// sendEmail : true
/// avatarId : 0
/// avatarImage : "string"
/// token : "string"
/// promoCode : 0
/// subscribed : true
/// jwtToken : "string"

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      String? userId, 
      String? fullName, 
      String? email, 
      String? passwordHash, 
      String? googleId, 
      String? facebookId, 
      String? officeId, 
      int? studingYear, 
      String? gradeName, 
      int? userRole, 
      String? mobileNumber, 
      int? country, 
      int? governorate, 
      int? yob, 
      int? gender, 
      bool? emailConfirmed, 
      bool? mobileNumberConfirmed, 
      bool? sendEmail, 
      int? avatarId, 
      String? avatarImage, 
      String? token, 
      int? promoCode, 
      bool? subscribed, 
      String? jwtToken,}){
    _userId = userId;
    _fullName = fullName;
    _email = email;
    _passwordHash = passwordHash;
    _googleId = googleId;
    _facebookId = facebookId;
    _officeId = officeId;
    _studingYear = studingYear;
    _gradeName = gradeName;
    _userRole = userRole;
    _mobileNumber = mobileNumber;
    _country = country;
    _governorate = governorate;
    _yob = yob;
    _gender = gender;
    _emailConfirmed = emailConfirmed;
    _mobileNumberConfirmed = mobileNumberConfirmed;
    _sendEmail = sendEmail;
    _avatarId = avatarId;
    _avatarImage = avatarImage;
    _token = token;
    _promoCode = promoCode;
    _subscribed = subscribed;
    _jwtToken = jwtToken;
}

  LoginResponse.fromJson(dynamic json) {
    _userId = json['userId'];
    _fullName = json['fullName'];
    _email = json['email'];
    _passwordHash = json['passwordHash'];
    _googleId = json['googleId'];
    _facebookId = json['facebookId'];
    _officeId = json['officeId'];
    _studingYear = json['studingYear'];
    _gradeName = json['gradeName'];
    _userRole = json['userRole'];
    _mobileNumber = json['mobileNumber'];
    _country = json['country'];
    _governorate = json['governorate'];
    _yob = json['yob'];
    _gender = json['gender'];
    _emailConfirmed = json['emailConfirmed'];
    _mobileNumberConfirmed = json['mobileNumberConfirmed'];
    _sendEmail = json['sendEmail'];
    _avatarId = json['avatarId'];
    _avatarImage = json['avatarImage'];
    _token = json['token'];
    _promoCode = json['promoCode'];
    _subscribed = json['subscribed'];
    _jwtToken = json['jwtToken'];
  }
  String? _userId;
  String? _fullName;
  String? _email;
  String? _passwordHash;
  String? _googleId;
  String? _facebookId;
  String? _officeId;
  int? _studingYear;
  String? _gradeName;
  int? _userRole;
  String? _mobileNumber;
  int? _country;
  int? _governorate;
  int? _yob;
  int? _gender;
  bool? _emailConfirmed;
  bool? _mobileNumberConfirmed;
  bool? _sendEmail;
  int? _avatarId;
  String? _avatarImage;
  String? _token;
  int? _promoCode;
  bool? _subscribed;
  String? _jwtToken;

  String? get userId => _userId;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get passwordHash => _passwordHash;
  String? get googleId => _googleId;
  String? get facebookId => _facebookId;
  String? get officeId => _officeId;
  int? get studingYear => _studingYear;
  String? get gradeName => _gradeName;
  int? get userRole => _userRole;
  String? get mobileNumber => _mobileNumber;
  int? get country => _country;
  int? get governorate => _governorate;
  int? get yob => _yob;
  int? get gender => _gender;
  bool? get emailConfirmed => _emailConfirmed;
  bool? get mobileNumberConfirmed => _mobileNumberConfirmed;
  bool? get sendEmail => _sendEmail;
  int? get avatarId => _avatarId;
  String? get avatarImage => _avatarImage;
  String? get token => _token;
  int? get promoCode => _promoCode;
  bool? get subscribed => _subscribed;
  String? get jwtToken => _jwtToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['passwordHash'] = _passwordHash;
    map['googleId'] = _googleId;
    map['facebookId'] = _facebookId;
    map['officeId'] = _officeId;
    map['studingYear'] = _studingYear;
    map['gradeName'] = _gradeName;
    map['userRole'] = _userRole;
    map['mobileNumber'] = _mobileNumber;
    map['country'] = _country;
    map['governorate'] = _governorate;
    map['yob'] = _yob;
    map['gender'] = _gender;
    map['emailConfirmed'] = _emailConfirmed;
    map['mobileNumberConfirmed'] = _mobileNumberConfirmed;
    map['sendEmail'] = _sendEmail;
    map['avatarId'] = _avatarId;
    map['avatarImage'] = _avatarImage;
    map['token'] = _token;
    map['promoCode'] = _promoCode;
    map['subscribed'] = _subscribed;
    map['jwtToken'] = _jwtToken;
    return map;
  }

}