part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordSubmit extends ResetPasswordState {}
class ResetPasswordSuccess extends ResetPasswordState {}
class ResetPasswordFailed extends ResetPasswordState {
  final String errorMessage;
  ResetPasswordFailed({required this.errorMessage});

}
