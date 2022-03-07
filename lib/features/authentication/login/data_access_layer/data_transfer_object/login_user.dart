class LoginUser {
  
  String? email = "";

  String? mobileNumber = "";

  String? passwordHash = "";

  String? googleId = "";

  String? officeId = "";

  String? facebookId = "";

  LoginUser();

  @override
  String toString() {
    return 'LoginUser[email=$email, mobileNumber=$mobileNumber, passwordHash=$passwordHash, googleId=$googleId, officeId=$officeId, facebookId=$facebookId, ]';
  }

  LoginUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    passwordHash = json['passwordHash'];
    googleId = json['googleId'];
    officeId = json['officeId'];
    facebookId = json['facebookId'];
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'mobileNumber': mobileNumber,
      'passwordHash': passwordHash,
      'googleId': googleId,
      'officeId': officeId,
      'facebookId': facebookId
     };
  }

  static List<LoginUser> listFromJson(List<dynamic>? json) {
    return json == null ? List<LoginUser>.empty() : json.map((value) => LoginUser.fromJson(value)).toList();
  }

  static Map<String, LoginUser> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, LoginUser>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = LoginUser.fromJson(value));
    }
    return map;
  }
}
