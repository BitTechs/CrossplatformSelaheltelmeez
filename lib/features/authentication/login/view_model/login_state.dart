part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginSubmit extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginVerifiedSuccess extends LoginState {
  final LoginResponse response;
  const LoginVerifiedSuccess({required this.response});
  @override
  List<Object> get props => [];
}
class LoginNotVerifiedSuccess extends LoginState {
  final LoginResponse response;
  const LoginNotVerifiedSuccess({required this.response});
  @override
  List<Object> get props => [];
}
class LoginFailed extends LoginState {
  final String errorMessage;
  const LoginFailed({required this.errorMessage});
  @override
  List<Object> get props => [];
}
