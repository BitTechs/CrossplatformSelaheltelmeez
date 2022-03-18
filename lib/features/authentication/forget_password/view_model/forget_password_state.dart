part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}
class ForgetPasswordSubmit extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {}
class ForgetPasswordFailed extends ForgetPasswordState {
  final String errorMessage;
  ForgetPasswordFailed({required this.errorMessage});
}
