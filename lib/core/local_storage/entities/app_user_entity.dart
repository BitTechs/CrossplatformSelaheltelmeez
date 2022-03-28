import 'package:objectbox/objectbox.dart';

@Entity()
class AppUserEntity{
  @Id()
  int id = 0;
  @Index()
  final String appUserId;
  final String fullName;
  final String? email;
  final String? mobileNumber;
  String? grade;
  String? gender;
  String? country;
  String? dateOfBirth;
  String? governorate;
  final String referralCode;
  final String role;
  final String avatarUrl;
  final String? accessToken;
  final String? refreshToken;
  final bool isPremium;
  late  bool isEmailVerified;
  late  bool isMobileVerified;
  AppUserEntity({required this.appUserId,
    required this.isEmailVerified,
    required this.isMobileVerified,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    this.grade,
    this.country,
    this.dateOfBirth,
    this.governorate,
    this.gender,
    required this.referralCode,
    required this.role,
    required this.avatarUrl,
    this.accessToken,
    this.refreshToken,
    required this.isPremium});
}