import 'dart:convert';

RegisterUser registerUserFromJson(String str) => RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  String? fullName;
  String? email;
  String? googleId;
  String? facebookId;
  String? officeId;
  String? passwordHash;
  String? mobileNumber;
  int? studingYear;
  int? userRole;
  int? country;
  int? governorate;
  int? yob;
  int? gender;
  bool? sendEmail;

  RegisterUser(
      {this.fullName,
        this.email,
        this.googleId,
        this.facebookId,
        this.officeId,
        this.passwordHash,
        this.mobileNumber,
        this.studingYear,
        this.userRole,
        this.country,
        this.governorate,
        this.yob,
        this.gender,
        this.sendEmail});

  RegisterUser.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    googleId = json['googleId'];
    facebookId = json['facebookId'];
    officeId = json['officeId'];
    passwordHash = json['passwordHash'];
    mobileNumber = json['mobileNumber'];
    studingYear = json['studingYear'];
    userRole = json['userRole'];
    country = json['country'];
    governorate = json['governorate'];
    yob = json['yob'];
    gender = json['gender'];
    sendEmail = json['sendEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['googleId'] = googleId;
    data['facebookId'] = facebookId;
    data['officeId'] = officeId;
    data['passwordHash'] = passwordHash;
    data['mobileNumber'] = mobileNumber;
    data['studingYear'] = studingYear;
    data['userRole'] = userRole;
    data['country'] = country;
    data['governorate'] = governorate;
    data['yob'] = yob;
    data['gender'] = gender;
    data['sendEmail'] = sendEmail;
    return data;
  }
}
