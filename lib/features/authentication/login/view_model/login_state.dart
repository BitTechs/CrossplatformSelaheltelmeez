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
class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginFailed extends LoginState {
  final String errorMessage;
  const LoginFailed({required this.errorMessage});
  @override
  List<Object> get props => [];
}
