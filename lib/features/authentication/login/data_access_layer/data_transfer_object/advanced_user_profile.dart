class AdvancedUserProfile {
  
  String? userId;

  String? fullName;

  String? email;

  String? passwordHash;

  String? googleId;

  String? facebookId;

  String? officeId;

  int? studingYear;

  String? gradeName;

  int? userRole;

  String? mobileNumber;

  int? country;

  int? governorate;

  int? yob;

  int? gender;

  bool? emailConfirmed;

  bool? mobileNumberConfirmed;

  bool? sendEmail;

  int? avatarId;

  String? avatarImage;

  String? token;

  int? promoCode;

  bool? subscribed;

  String? jwtToken;

  AdvancedUserProfile();

  @override
  String toString() {
    return 'AdvancedUserProfile[userId=$userId, fullName=$fullName, email=$email, passwordHash=$passwordHash, googleId=$googleId, facebookId=$facebookId, officeId=$officeId, studingYear=$studingYear, gradeName=$gradeName, userRole=$userRole, mobileNumber=$mobileNumber, country=$country, governorate=$governorate, yob=$yob, gender=$gender, emailConfirmed=$emailConfirmed, mobileNumberConfirmed=$mobileNumberConfirmed, sendEmail=$sendEmail, avatarId=$avatarId, avatarImage=$avatarImage, token=$token, promoCode=$promoCode, subscribed=$subscribed, jwtToken=$jwtToken, ]';
  }

  AdvancedUserProfile.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    passwordHash = json['passwordHash'];
    googleId = json['googleId'];
    facebookId = json['facebookId'];
    officeId = json['officeId'];
    studingYear = json['studingYear'];
    gradeName = json['gradeName'];
    userRole = json['userRole'];
    mobileNumber = json['mobileNumber'];
    country = json['country'];
    governorate = json['governorate'];
    yob = json['yob'];
    gender = json['gender'];
    emailConfirmed = json['emailConfirmed'];
    mobileNumberConfirmed = json['mobileNumberConfirmed'];
    sendEmail = json['sendEmail'];
    avatarId = json['avatarId'];
    avatarImage = json['avatarImage'];
    token = json['token'];
    promoCode = json['promoCode'];
    subscribed = json['subscribed'];
    jwtToken = json['jwtToken'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'passwordHash': passwordHash,
      'googleId': googleId,
      'facebookId': facebookId,
      'officeId': officeId,
      'studingYear': studingYear,
      'gradeName': gradeName,
      'userRole': userRole,
      'mobileNumber': mobileNumber,
      'country': country,
      'governorate': governorate,
      'yob': yob,
      'gender': gender,
      'emailConfirmed': emailConfirmed,
      'mobileNumberConfirmed': mobileNumberConfirmed,
      'sendEmail': sendEmail,
      'avatarId': avatarId,
      'avatarImage': avatarImage,
      'token': token,
      'promoCode': promoCode,
      'subscribed': subscribed,
      'jwtToken': jwtToken
     };
  }

  static List<AdvancedUserProfile> listFromJson(List<dynamic>? json) {
    return json == null ? List<AdvancedUserProfile>.empty() : json.map((value) => AdvancedUserProfile.fromJson(value)).toList();
  }

  static Map<String, AdvancedUserProfile> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = <String, AdvancedUserProfile>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = AdvancedUserProfile.fromJson(value));
    }
    return map;
  }
}
