part of 'validate_forget_password_otp_cubit.dart';

@immutable
abstract class ValidateForgetPasswordOtpState {}

class ValidateForgetPasswordOtpInitial extends ValidateForgetPasswordOtpState {}
class ValidateForgetPasswordOtpSubmit extends ValidateForgetPasswordOtpState {}
class ValidateForgetPasswordOtpSuccess extends ValidateForgetPasswordOtpState {
  final String identityUserId;
  ValidateForgetPasswordOtpSuccess({required this.identityUserId});
}
class ValidateForgetPasswordOtpFailed extends ValidateForgetPasswordOtpState {
  final String errorMessage;
  ValidateForgetPasswordOtpFailed({required this.errorMessage});
}
