part of 'validate_otp_cubit.dart';

@immutable
abstract class ValidateOtpState {}

class ValidateOtpInitial extends ValidateOtpState {}
class ValidateOtpSubmit extends ValidateOtpState {}
class ValidateOtpSuccess extends ValidateOtpState {}
class ResendValidateOtpSuccess extends ValidateOtpState {}
class ValidateOtpFailed extends ValidateOtpState {
  final String errorMessage;
  ValidateOtpFailed({required this.errorMessage});
}
